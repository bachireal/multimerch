<div class="box">
	<div class="box-heading"><?php echo $ms_carousel_sellers; ?></div>
	<div class="box-content">
		<div id="carousel<?php echo $module; ?>" class="ms-carousel">
		  <ul class="jcarousel-skin-opencart">
		    <?php foreach ($sellers as $seller) { ?>
		    <li>
		    	<a href="<?php echo $seller['href']; ?>"><img src="<?php echo $seller['image']; ?>" title="<?php echo $seller['nickname']; ?>" /></a>
		    	<a href="<?php echo $seller['href']; ?>"><?php echo $seller['nickname']; ?></a>
	    	</li>
		    <?php } ?>
		  </ul>
	      <p style="text-align: right; margin: 0"><a href="<?php echo $sellers_href ?>"><?php echo $ms_carousel_view; ?></a></p>		  
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?> ul').jcarousel({
	vertical: false,
	visible: <?php echo $limit; ?>,
	scroll: <?php echo $scroll; ?>
});
//--></script>