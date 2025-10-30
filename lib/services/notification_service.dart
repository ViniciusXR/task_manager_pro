import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;

    // Inicializar timezone
    tz.initializeTimeZones();

    // Configurações para Android
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    // Configurações para iOS
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _initialized = true;
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Aqui você pode adicionar lógica para quando a notificação for tocada
    print('Notificação tocada: ${response.payload}');
  }

  Future<void> scheduleTaskReminder({
    required String taskId,
    required String title,
    required String description,
    required DateTime scheduledTime,
  }) async {
    await initialize();

    // Cancelar notificação existente se houver
    await cancelNotification(taskId);

    // Verificar se a data é no futuro
    if (scheduledTime.isBefore(DateTime.now())) {
      print('Data de lembrete é no passado, não agendando notificação');
      return;
    }

    // Detalhes da notificação para Android
    const androidDetails = AndroidNotificationDetails(
      'task_reminders',
      'Lembretes de Tarefas',
      channelDescription: 'Notificações de lembretes de tarefas',
      importance: Importance.high,
      priority: Priority.high,
      icon: '@mipmap/ic_launcher',
    );

    // Detalhes da notificação para iOS
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    try {
      // Converter para timezone
      final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

      // Tentar agendar com alarme exato
      await _notifications.zonedSchedule(
        taskId.hashCode, // ID único baseado no ID da tarefa
        '📋 Lembrete: $title',
        description.isNotEmpty ? description : 'Você tem uma tarefa pendente',
        tzScheduledTime,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: taskId,
      );

      print('Notificação agendada para: $tzScheduledTime');
    } catch (e) {
      // Se falhar com alarme exato, tentar com alarme inexato
      print('Erro ao agendar com alarme exato: $e');
      print('Tentando agendar com alarme inexato...');
      
      try {
        final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);
        
        await _notifications.zonedSchedule(
          taskId.hashCode,
          '📋 Lembrete: $title',
          description.isNotEmpty ? description : 'Você tem uma tarefa pendente',
          tzScheduledTime,
          details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          payload: taskId,
        );
        
        print('Notificação agendada com alarme inexato para: $tzScheduledTime');
      } catch (e2) {
        print('Erro ao agendar notificação: $e2');
        // Notificação não será agendada, mas não impedirá a criação da tarefa
      }
    }
  }

  Future<void> cancelNotification(String taskId) async {
    await _notifications.cancel(taskId.hashCode);
  }

  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  Future<bool> requestPermissions() async {
    if (_notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>() !=
        null) {
      return await _notifications
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.requestNotificationsPermission() ??
          false;
    }

    if (_notifications.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>() !=
        null) {
      return await _notifications
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;
    }

    return false;
  }
}
