<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content" class="ms-catalog-seller-profile">
	<?php echo $content_top; ?>
	
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
	
	<div class="ms-sellerprofile">
		<div class="seller-data">
			<div class="avatar-box">
				<h2><?php echo $seller['nickname']; ?></h2>
				<img src="<?php echo $seller['thumb']; ?>" />

				<br />
				<?php foreach($seller['badges'] as $badge) { ?>
					<img src="<?php echo $badge['image']; ?>" title="<?php echo $badge['description']; ?>" />
				<?php } ?>
			</div>
			
			<div class="info-box">
				<?php if ($seller['country']) { ?>
					<p><b><?php echo $ms_catalog_seller_profile_country; ?></b> <?php echo $seller['country']; ?></p>
				<?php } ?>
				
				<?php if ($seller['company']) { ?>
					<p><b><?php echo $ms_catalog_seller_profile_company; ?></b> <?php echo $seller['company']; ?></p>
				<?php } ?>
				
				<?php if ($seller['website']) { ?>
					<p><b><?php echo $ms_catalog_seller_profile_website; ?></b> <?php echo $seller['website']; ?></p>
				<?php } ?>
				
				<p><b><?php echo $ms_catalog_seller_profile_totalsales; ?></b> <?php echo $seller['total_sales']; ?></p>
				<p><b><?php echo $ms_catalog_seller_profile_totalproducts; ?></b> <?php echo $seller['total_products']; ?></p>
				<?php if (!$this->config->get('msconf_hide_contact_seller')) { ?>
					<p><a href="index.php?route=seller/catalog-seller/jxRenderContactDialog&seller_id=<?php echo $seller_id; ?>" class="ms-sellercontact" title="<?php echo $ms_sellercontact_title; ?>"><?php echo $ms_catalog_product_contact; ?></a></p>
				<?php } ?>
			</div>
		</div>
			
		<div class="seller-description">
			<h4>About the seller</h4>
			<?php echo $seller['description']; ?>
		</div>
	</div>

	<?php if ($seller['products']) { ?>
	<div class="box">
		<div class="box-heading"><?php echo $ms_catalog_seller_profile_products; ?></div>
		<div class="box-content">
			<div class="box-product">
				<?php foreach ($seller['products'] as $product) { ?>
				<div>
					<?php if ($product['thumb']) { ?>
						<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
					<?php } ?>
					
					<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
					
					<?php if ($product['price']) { ?>
						<div class="price">
							<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
							<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
							<?php } ?>
						</div>
					<?php } ?>
					
					<?php if ($product['rating']) { ?>
						<div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
					<?php } ?>
					
					<div class="cart">
						<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
					</div>
				</div>
				<?php } ?>
			</div>
			<p style="text-align: right; margin: 0"><a href="<?php echo $seller['href']; ?>"><?php echo $ms_catalog_seller_profile_view; ?></a></p>
		</div>
	</div>
	<?php } ?>
    
    <?php if ($this->config->get('msconf_seller_comments_enable')) { ?>

    <script type="text/javascript" src="catalog/view/javascript/ms-comments.js"></script>
    <?php if(file_exists('catalog/view/theme/'.$this->config->get('config_template').'/stylesheet/ms-comments.css')){ ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template'); ?>/stylesheet/ms-comments.css" />
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ms-comments.css" />
    <?php } ?>
    <script type="text/javascript">
    <!--
    $(function(){
        $('#tab-comments .pcForm').load('index.php?route=module/ms-comments/renderForm&seller_id=<?php echo $seller_id; ?>>');
        $('#tab-comments .pcComments').load('index.php?route=module/ms-comments/renderComments&seller_id=<?php echo $seller_id; ?>');
    });
    //-->
    </script>

    <div id="tab-comments">
        <div class="pcComments"></div>
        <div class="pcForm"></div>
    </div>
    <?php } ?>    
	
	<?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>