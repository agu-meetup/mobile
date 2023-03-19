import 'package:agu_meetup_mobile/data/event/datasources/event_server_datasource.dart';
import 'package:agu_meetup_mobile/data/event/models/create_event_request_model.dart';

class EventRepository {
  /// Data Layers
  EventServerDatasource eventServerDatasource = EventServerDatasource();

  Future<void> createEvent(CreateEventRequestModel createEventRequestModel) async{
    await eventServerDatasource.createEvent(createEventRequestModel);
  }
}