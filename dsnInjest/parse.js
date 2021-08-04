function parseLine(line) {
    var contact_event, entry_epoch;
    [contact_event,
      entry_epoch,
      exit_epoch,
      duration,
      data_rate,
      aos_constraint,
      los_constraint,
      ...rest] = line.split(/\s{2,}/);
      var temp = contact_event.split(' --> ');
      station = temp[0];
      mms_antenna = temp[1];
    return {
      station,
      mms_antenna,
      entry_epoch,
      exit_epoch,
      duration,
      data_rate,
      aos_constraint,
      los_constraint
    }
}

function parseStations(station){
  var list = station.split("(");
  var station_name = list[0].trim();
  var station_antennas = list[1].split(',');
  station_antennas = station_antennas.map(x => x.trim());
  return{
    station_name,
    station_antennas
  }
}
function parseHeader(header){
  var spacecraft, attitude, start_time, stop_time, project, source, file_creation_date, stations, events;
  spacecraft = header[0].split('=')[1].trim();
  attitude = header[1].split('=')[1].trim();
  start_time = header[2].split('=')[1].trim();
  stop_time = header[3].split('=')[1].trim();
  project = header[4].split('=')[1].trim();
  source = header[5].split('=')[1].trim();
  file_creation_date = header[6].split('=')[1].trim();
  stations_line = header[7].split('=')[1].trim();
  stations_list = stations_line.split('),');
  stations = stations_list.map(station => parseStations(station));
  return {
    spacecraft,
    attitude,
    start_time,
    stop_time,
    project,
    source,
    file_creation_date,
    stations,
    events
  }
}

exports.parseHeader = parseHeader;
exports.parseLine = parseLine;