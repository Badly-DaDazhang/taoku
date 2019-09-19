$(function(){

  //sidebar-menu
  $(document).ready(function () {
    $.each($(".side-menu > a"), function () {
      $(this).click(function () {
        var ulNode = $(this).next("ul");
        if (ulNode.css('display') == 'block') {
          $.cookie(COOKIE_PRE + 'Mmenu_' + $(this).attr('key'), 1);
        } else {
          $.cookie(COOKIE_PRE + 'Mmenu_' + $(this).attr('key'), null);
        }
        ulNode.slideToggle();
        if ($(this).hasClass('shrink')) {
          $(this).removeClass('shrink');
        } else {
          $(this).addClass('shrink');
        }
      });
    });
    $.each($(".side-menu-quick > a"), function () {
      $(this).click(function () {
        var ulNode = $(this).next("ul");
        ulNode.slideToggle();
        if ($(this).hasClass('shrink')) {
          $(this).removeClass('shrink');
        } else {
          $(this).addClass('shrink');
        }
      });
    });
  });
  $(function () {
    //展开关闭常用菜单设置
    $('.set-btn').bind("click",
      function () {
        $(".set-container-arrow").show("fast");
        $(".set-container").show("fast");
      });
    $('[nctype="closeCommonOperations"]').bind("click",
      function () {
        $(".set-container-arrow").hide("fast");
        $(".set-container").hide("fast");
      });

    $('dl[nctype="checkcCommonOperations"]').find('input').click(function () {
      var _this = $(this);
      var _dd = _this.parents('dd:first');
      var _type = _this.is(':checked') ? 'add' : 'del';
      var _value = _this.attr('name');
      var _operations = $('[nctype="commonOperations"]');

      // 最多添加5个
      if (_operations.find('li').length >= 5 && _type == 'add') {
        showError('最多只能添加5个常用选项。');
        return false;
      }
      $.getJSON('https://www.taokubuy.com/shop/index.php?act=member&op=common_operations', { type: _type, value: _value }, function (data) {
        if (data) {
          if (_type == 'add') {
            _dd.addClass('checked');
            if (_operations.find('li').length == 0) {
              _operations.fadeIn('slow');
            }
            _operations.find('ul').append('<li style="display : none;" nctype="' + _value + '"><a href="' + _this.attr('data-value') + '">' + _this.attr('data-name') + '</a></li>');
            _operations.find('li[style]').fadeIn('slow');
          } else {
            _dd.removeClass('checked');
            _operations.find('li[nctype="' + _value + '"]').fadeOut('slow', function () {
              $(this).remove();
              if (_operations.find('li').length == 0) {
                _operations.fadeOut('slow');
              }
            });
          }
        }
      });
    });
  });


})
