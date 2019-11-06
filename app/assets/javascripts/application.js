// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
//= require turbolinks
//= require_tree ../../../vendor/assets/javascripts/.
//= require underscore
//= require_tree .

$(document).on('turbolinks:load', function () {
    Turbolinks.clearCache() //ページ遷移時に一瞬映るのを防ぐ
    $('.drawer_button').click(function () {
        $(this).toggleClass('active');
        $('.drawer_bg').fadeToggle();
        $('nav').toggleClass('open');
    })
    //closeではなく、背景を押した時にも閉じる
    $('.drawer_bg').click(function () {
        $(this).fadeOut();
        $('.drawer_button').removeClass('active');
        $('nav').removeClass('open');
    });
})
