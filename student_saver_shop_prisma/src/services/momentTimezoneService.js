import moment from 'moment-timezone';

const timezone_name ="Africa/Dar_es_Salaam";
 
function server_datetime(format){
    var jun = moment(new Date());
    jun.tz(timezone_name).format();
    return jun.format(format);
}

const serverYYYYMMDDHHmmss = function server_YYYYMMDD_HHmmss(){
    return server_datetime('YYYY-MM-DD HH:mm:ss');
}

export default serverYYYYMMDDHHmmss;