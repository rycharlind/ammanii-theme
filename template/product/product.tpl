<?php echo $header; ?>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','//connect.facebook.net/en_US/fbevents.js');

fbq('init', '1638457513110572');
fbq('track', "PageView");</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1638457513110572&ev=PageView&noscript=1"
/></noscript>

<?php
require_once 'Mobile-Detect-2.8.17/Mobile_Detect.php';
$detect = new Mobile_Detect;
if ( $detect->isMobile() ) {
echo"<script type='text/javascript'>
  window.onload = function(){
    window.scrollTo(0, $(document).height()*0.148);
  }
</script>";
}
else {echo"<script type='text/javascript'>
    window.onload = function(){
      //window.scrollTo(0, $(document).height()*0.28);
    }
</script>";}

?>


<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row">
  <?php echo $column_left; ?>

  <?php 
  if ($column_left && $column_right) {
    $content_width = 'col-sm-6';
    $content_left  = 'col-sm-6';
    $content_right = 'col-sm-6';
  } elseif ($column_left || $column_right) {
    $content_width = 'col-sm-9';
    $content_left  = 'col-sm-5';
    $content_right = 'col-sm-7';
  } else {
    $content_width = 'col-sm-12';
    $content_left  = 'col-sm-5 col-lg-7';
    $content_right = 'col-sm-7 col-lg-5';
  } ?>

  <div id="content" class="<?php echo $content_width; ?> product_page"><?php echo $content_top; ?>
    <div class="row product-content-columns">
      
      <!-- Content left -->
      <div class="<?php echo $content_left; ?> product_page-left">        
        <!-- product image -->
        <div id="default_gallery" class="product-gallery">
          <?php if ($thumb || $images) { ?>
          <?php if ($images|| $thumb) { ?>
          <div class="image-thumb">

          <div class="bx-wrapper">

            <div class="bx-viewport">

                <ul id="image-additional" class="image-additional">

                  <?php if (!empty($thumb)) { ?>
                  <li>
                    <a href="#" data-image="<?php echo $thumb; ?>">
                      <img src="<?php echo $thumb; ?>" alt=""/>
                    </a>
                  </li>
                  <?php } ?>
                  <?php foreach ($images as $image) { ?>
                  <li>
                    <a href="#" data-image="<?php echo $image['popup']; ?>">
                      <img src="<?php echo $image['thumb']; ?>" alt=""/></a>
                  </li>
                  <?php } ?>

                </ul>

              </div>

            </div>

          </div>
          <?php } ?>


          <?php if ($thumb) { ?>
          <div id="product-image" class="product-image">
            <div class="magnificent-wrap">
              <div class="magnificent" data-magnificent="product-image">
                <div class="polaroid">
                  <div class="inner">
                    <img id="" src="<?php echo $thumb; ?>"/>
                  </div>
                </div>
              </div>
            </div>

            <div class="magnificent-viewport-wrap">
              <!--<div data-magnificent-viewport="product-image">-->
              <div>
                <div class="inner">
                  <img src="<?php echo $popup; ?>"/>
                </div>
              </div>
            </div>

            <script class="source">
              $(function () {
                $('#product-image [data-magnificent]').magnificent();
              });
            </script>

          </div>
          <?php } ?>
          <?php } ?>
        </div>
    
    
        <?php $i=0; if ($thumb || $images) { $i++?>
        <script type="text/javascript">
          jQuery(document).ready(function(){
          var myPhotoSwipe = $("#gallery a").photoSwipe({ enableMouseWheel: false , enableKeyboard: false, captionAndToolbarAutoHideDelay:0 });
          });
        </script>
        <div id="full_gallery">
          <ul id="gallery">
            <?php if (!empty($thumb)) { ?><li><a href="<?php echo $popup; ?>" data-something="something" data-another-thing="anotherthing"><img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li><?php } ?>
            <?php foreach ($images as $image) { ?>
            <li><a href="<?php echo $image['popup']; ?>" data-something="something<?php echo $i?>" data-another-thing="anotherthing<?php echo $i?>"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
              <?php } ?>
          </ul>     
        </div>
        <?php } ?>        
      </div>


      <!-- Content right -->
      <div class="<?php echo $content_right; ?> product_page-right">
        <div class="general_info product-info">

          <h1 class="product-title"><?php echo $heading_title; ?></h1>
          

          <?php if ($price) { ?>
          <div class="price-section">
            <span class="price-new"><?php echo $special; ?></span>
            <?php if (!$special) { ?>
            <span class="price-new"><?php echo $price; ?></span>
            <?php } else { ?>
            <span class="price-old"><?php echo $price; ?></span>
            <?php } ?>
            <?php if ($tax) { ?>
            <span class="tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span>
            <?php } ?>
            <div class="reward-block">
              <?php if ($points) { ?>
              <span class="reward"><?php echo $text_points; ?> <?php echo $points; ?></span>
              <?php } ?>
              <?php if ($discounts) { ?>
              <?php foreach ($discounts as $discount) { ?>
              <span><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></span>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <?php } ?>


          <div id="tab-description" class="product-desc product-section">
            <?php echo $description; ?>
            <div class="clearfix"></div>
          </div>


          <!--
          <ul class="list-unstyled product-section">
            <?php if ($manufacturer) { ?>
            <li><?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></li>
            <?php } ?>
            <li><?php echo $text_model; ?> <span><?php echo $model; ?></span></li>
            <?php if ($reward) { ?>
            <li><?php echo $text_reward; ?> <span><?php echo $reward; ?></span></li>
            <?php } ?>
            <li><?php echo $text_stock; ?> <span><?php echo $stock; ?></span></li>
          </ul>
          -->


        </div>
        
        <div id="product">

          <!-- Product options -->
          <div class="product-options form-horizontal">
            <?php if ($options) { ?>
              <h3><?php echo $text_option; ?></h3>
              <?php foreach ($options as $option) { ?>
                <?php if ($option['type'] == 'select') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="col-sm-8">
                      <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                        </option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'radio') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="radio">
                          <label>
                          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                          <?php echo $option_value['name']; ?>
                          <?php if ($option_value['price']) { ?>
                          (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                          <?php } ?>
                          </label>
                        </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'checkbox') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                        <div class="checkbox">
                          <label>
                          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                          <?php echo $option_value['name']; ?>
                          <?php if ($option_value['price']) { ?>
                          (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                          <?php } ?>
                          </label>
                        </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'image') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
                    <div id="input-option<?php echo $option['product_option_id']; ?>" class="col-sm-8">
                      <?php foreach ($option['product_option_value'] as $option_value) { ?>
                      <div class="radio">
                        <label>
                        <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                        <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                        <?php if ($option_value['price']) { ?>
                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                        <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'text') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="col-sm-8">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'textarea') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="col-sm-8">
                      <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'file') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4"><?php echo $option['name']; ?></label>
                    <div class="col-sm-8">
                      <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-block btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                      <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'date') { ?>
                  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                    <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                    <div class="input-group  col-sm-8 date">
                      <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                      </span>
                    </div>
                  </div>
                <?php } ?>
                <?php if ($option['type'] == 'datetime') { ?>
                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group col-sm-8 datetime">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                </div>
                <?php } ?>
                <?php if ($option['type'] == 'time') { ?>
                <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label col-sm-4" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group col-sm-8 time">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                </div>
                <?php } ?>
              <?php } ?>
            <?php } ?>
          </div>


        
          <!-- Add to cart form -->
          <div class="form-group form-horizontal">
            <div class="form-group">
              <label class="control-label col-sm-1" for="input-quantity"><?php echo $entry_qty; ?></label>
              <div class="col-sm-2">
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              </div>
            </div>
            
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-add"><?php echo $button_cart; ?></button>
          </div>

                  

          <?php if ($tags) { ?>
          <!-- Product tags 
          <div class="product-tags">
            <?php echo $text_tags; ?>
            <?php for ($i = 0; $i < count($tags); $i++) { ?>
              <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
              <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
              <?php } ?>
            <?php } ?>
          </div> -->
          <?php } ?>
          <div class="product-share">
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style">
              <a class="addthis_button_facebook_like" ></a> 
              <a class="addthis_button_tweet"></a>
            </div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
          <!-- AddThis Button END --> 
          </div>

          <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
          <?php } ?>
        </div>

      </div>
    </div>

    <?php if ($attribute_groups) { ?>
    <!-- Product specifications -->
    <div id="tab-specification" class="product-spec product-section">
      <h3 class="product-section_title"><?php echo $tab_attribute; ?></h3>
      <table class="table table-bordered">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <tbody>
        <tr>
          <th colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></th>
        </tr>
      </tbody>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
        <td><?php echo $attribute['name']; ?></td>
        <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
      </table>
    </div>
    <?php } ?>



    <!-- Related products -->
    <?php if ($products) { ?>   
    <div class="related-products product-section">
      <h3 class="product-section_title"><?php echo $text_related; ?></h3>
      <div class="related-slider">        
        <?php foreach ($products as $product) { ?>
        
        <div>
          <div class="product-thumb transition">
            <div class="image">
              <a class="lazy" style="padding-bottom: <?php echo ($product['img-height']/$product['img-width']*100); ?>%"
                href="<?php echo $product['href']; ?>">
              <img alt="<?php echo $product['name']; ?>"
                title="<?php echo $product['name']; ?>"
                class="img-responsive"
                data-src="<?php echo $product['thumb']; ?>"
                src="#"/>
              </a>
            </div>
            <div class="caption">
              <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <p><?php echo $product['description']; ?></p>
              
              <!-- Rating -->
              <?php if ($product['rating']) { ?>
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                  <?php } ?>
                <?php } ?>
              </div>
              <?php } ?>

              <!-- price -->
              <?php if ($product['price']) { ?>
                <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="cart-button">
              <button class="product-btn-add" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');">
                <span class="hidden"><?php echo $button_cart; ?></span>
                <i class="fa fa-shopping-cart"></i> 
              </button>
              
            </div>
              <div class="clear"></div>
          </div>
        </div>

        <?php } ?>
      </div>
    </div>
    <?php } ?>

    <?php echo $content_bottom; ?></div>
  <?php echo $column_right; ?></div>
</div>

<script>
    document.getElementById('input-quantity').onkeypress = function(e) {

  e = e || event;

  if (e.ctrlKey || e.altKey || e.metaKey) return;

  var chr = getChar(e);

  if (chr == null) return;

  if (chr < '0' || chr > '9') {
    return false;
  }

}

function getChar(event) {
  if (event.which == null) {
    if (event.keyCode < 32) return null;
    return String.fromCharCode(event.keyCode) // IE
  }

  if (event.which!=0 && event.charCode!=0) {
    if (event.which < 32) return null;
    return String.fromCharCode(event.which)   
  }

  return null; 
}
  jQuery('#reviews_form_title').addClass('close-tab');
  jQuery('#reviews_form_title').on("click", function(){
  if (jQuery(this).hasClass('close-tab')) { jQuery(this).removeClass('close').parents('#tab-review').find('#reviews_form').slideToggle(); }
    else {
    jQuery(this).addClass('close-tab').parents('#tab-review').find('#reviews_form').slideToggle();
  }
  })
</script>

<script type="text/javascript"><!--
  $('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
    $.ajax({
      url: 'index.php?route=product/product/getRecurringDescription',
      type: 'post',
      data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
      dataType: 'json',
      beforeSend: function() {
        $('#recurring-description').html('');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        
        if (json['success']) {
          $('#recurring-description').html(json['success']);
        }
      }
    });
  });
  //-->
</script> 

<script type="text/javascript"><!--
  $('#button-cart').on('click', function() {
    $.ajax({
      url: 'index.php?route=checkout/cart/add',
      type: 'post',
      data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
      dataType: 'json',
      beforeSend: function() {
        $('#button-cart').button('loading');
      },
      complete: function() {
        $('#button-cart').button('reset');
      },
      success: function(json) {
        $('.alert, .text-danger').remove();
        $('.form-group').removeClass('has-error');

        if (json['error']) {
          if (json['error']['option']) {
            for (i in json['error']['option']) {
              var element = $('#input-option' + i.replace('_', '-'));
              
              if (element.parent().hasClass('input-group')) {
                element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              } else {
                element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
              }
            }
          }
          
          if (json['error']['recurring']) {
            $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
          }
          
          // Highlight any found errors
          $('.text-danger').parent().addClass('has-error');
        }
        
        if (json['success']) {
          $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          
          
          
          <!--$('html, body').animate({ scrollTop: 0 }, 'slow');-->
          
          $('#cart').load('index.php?route=common/cart/info #cart');
          setTimeout(function() {
            $('.alert').fadeOut(1000)
            //location.reload();
          }, 1000)
        }
      }
    });
  });
  //-->
</script> 

<script type="text/javascript"><!--
  $('.date').datetimepicker({
    pickTime: false
  });

  $('.datetime').datetimepicker({
    pickDate: true,
    pickTime: true
  });

  $('.time').datetimepicker({
    pickDate: false
  });

  $('button[id^=\'button-upload\']').on('click', function() {
    var node = this;
    
    $('#form-upload').remove();
    
    $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
    
    $('#form-upload input[name=\'file\']').trigger('click');
    
    $('#form-upload input[name=\'file\']').on('change', function() {
      $.ajax({
        url: 'index.php?route=tool/upload',
        type: 'post',
        dataType: 'json',
        data: new FormData($(this).parent()[0]),
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function() {
          $(node).button('loading');
        },
        complete: function() {
          $(node).button('reset');
        },
        success: function(json) {
          $('.text-danger').remove();
          
          if (json['error']) {
            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
          }
          
          if (json['success']) {
            alert(json['success']);
            
            $(node).parent().find('input').attr('value', json['code']);
          }
        },
        error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
      });
    });
  });
  //-->
</script> 

<script type="text/javascript"><!--
  $('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
  });

  $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

  $('#button-review').on('click', function() {
    $.ajax({
      url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
      type: 'post',
      dataType: 'json',
      data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
      beforeSend: function() {
        $('#button-review').button('loading');
      },
      complete: function() {
        $('#button-review').button('reset');
        $('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
        $('input[name=\'captcha\']').val('');
      },
      success: function(json) {
        $('.alert-success, .alert-danger').remove();
        
        if (json['error']) {
          $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
        }
        
        if (json['success']) {
          $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
          
          $('input[name=\'name\']').val('');
          $('textarea[name=\'text\']').val('');
          $('input[name=\'rating\']:checked').prop('checked', false);
          $('input[name=\'captcha\']').val('');
        }
      }
    });
  });
  //-->
</script> 

<?php echo $footer; ?>