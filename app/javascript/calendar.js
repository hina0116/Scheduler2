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

      locale: 'ja',
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
      selectable: true,
      select: function (info) {

        const eventName = prompt("イベントを入力してください");

        if (eventName) {
            calendar.addEvent({
                title: eventName,
                start: info.start,
                end: info.end,
                allDay: true,
            });
        }
      },
      editable: true,
      dayMaxEvents: true,
      allDayText: '',
      height: "auto",
      nowIndicator: true,
    });

  calendar.render();

});