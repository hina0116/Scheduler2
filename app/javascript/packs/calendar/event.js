import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from "@fullcalendar/list";

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');

  /*global FullCalendar*/
  var calendar = new Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin],

      // locale: 'ja',
      eventTimeFormat: { // like '14:30:00'
        hour: '2-digit',
        minute: '2-digit',
        meridiem: false
      },
      timeZone: 'Asia/Tokyo',
      firstDay: 0,
    　navLinks: true,
      headerToolbar: {
        start: 'prev,next today',
        center: 'title',
        end: 'dayGridMonth,timeGridWeek,timeGridDay listWeek'
      },
      expandRows: true,
      stickyHeaderDates: true,
      buttonText: {
        today: '今日',
        month: '月',
        week: '週',
        day: '日',
        list: 'リスト'
      },
      dateClick: function(info){
        const year  = info.date.getFullYear();
        const month = (info.date.getMonth() + 1);
        const day   = info.date.getDate();
        /*global $*/
        $.ajax({
          type: 'GET',
          url:  '/events/new.js',
          data: {year: year, month: month, day: day}
        }).done(function (res) {

          // $('#modal').fadeIn();

        }).fail(function (result) {
          alert("failed");
        });
      },

      eventClick: function(event) {
        var title = prompt('予定を更新してください:');
          if(title && title!=""){
            event.title = title;
            $('#calendar').fullCalendar('updateEvent', event);
          }else{
            $('#calendar').fullCalendar("removeEvents", event.id);
          }
      },

      selectable: true,
      editable: true,
      dayMaxEvents: true,
      allDayText: '',
      height: "auto",
      nowIndicator: true,
      events: '/events.json'
    });



  calendar.render();

  $(".error").click(function(){
    calendar.refetchEvents();
  });

});