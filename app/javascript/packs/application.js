// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap/dist/js/bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// 目標設定
$(function(){
    $('.js-modal-open').on('click',function(){
        $('.js-modal').fadeIn();
	// イベントが行う処理をキャンセルする
        return false;
    });
    $('.js-modal-close').on('click',function(){
        $('.js-modal').fadeOut();
        return false;
    });
});