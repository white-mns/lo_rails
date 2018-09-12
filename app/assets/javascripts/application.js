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
//= require turbolinks
//= require_tree .
//= require jquery
//= require bootstrap-sprockets
//= require "jquery.cleanQuery"
//= require chartkick

// 検索遷移時の検索フォームの閉じる処理
function search_close() {
    $(".search_toggle").children().eq(1).hide();
    $(".search_toggle").children().eq(0).find(".act_desc").toggle();
};

function set_triggers() {
    $(".example_toggle").on("click", function() {
        $(this).parent().next().slideToggle(200);
        $(this).find(".act_desc").toggle();
    });

    $(".search_toggle").children().eq(0).on("click", function() {
        $(this).next().toggle();
        $(this).find(".act_desc").toggle();
    });
    
    $(".td__toggle").on("click", function() {
        $(this).next().slideToggle();
        $(this).find(".act_desc").toggle();
    });
};

// ページ移動時の発火処理
var turboReady = function(){
	var url     = location.href;
    var params  = url.split("?");

	if(params[1]){
        search_close();
	}

    $('FORM').cleanQuery();

    set_triggers();
};

$(document).on('turbolinks:load', turboReady);

