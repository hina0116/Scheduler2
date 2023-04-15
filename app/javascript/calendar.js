import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import interactionPlugin from '@fullcalendar/interaction';
import listPlugin from '@fullcalendar/list';
import multimonthPlugin from '@fullcalendar/multimonth';
import scrollgridPlugin from '@fullcalendar/scrollgrid';

document.addEventListener('turbolinks:load', function() {
  var calendarEl = document.getElementById('calendar');

  /*global FullCalendar*/
  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: [ dayGridPlugin, timeGridPlugin, interactionPlugin, listPlugin, multimonthPlugin, scrollgridPlugin],

      locale: 'ja',
      timeZone: 'Asia/Tokyo',
      firstDay: 1,
      navLinks: true,
      headerToolbar: {
        start: 'prev,next today',
        center: 'title',
        end: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      expandRows: true,
      stickyHeaderDates: true,
      buttonText: {
         today: '今日',
         month: '月',
         week: '週',
         day: '日'
      },
      allDayText: '',
      height: "auto",
      initialView: 'timeGridMonth',
      nowIndicator: true
  });

  calendar.render();
});