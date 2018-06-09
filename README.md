# README

#### active-storage
```
  $ rails active_storage:install 
  $ rake db:migrate

```
#### create model record with image

```
$ rails g resource Gallery title:string   #example
$ rake db:migrate 
```
#### see app-active-storage/app/model/gallery
```
class Gallery < ApplicationRecord
	has_one_attached :image
end
```
#### see app-active-storage/app/controllers/galleries
```
class GalleriesController < ApplicationController

	def index
		@ids = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def create
		gallery = Gallery.create!(gallery_params)
		redirect_to gallery
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	private

	def gallery_params
		params.require(:gallery).permit(:title, :image)
	end
end

```
#### see app-active-storage/app/views/galleries/new
```
<%= form_with model: @gallery, local: true, class: 'ui form' do  |g| %>
<div class="field">
	<label>Title</label>
	<%= g.text_field :title %>
</div>

<div class="field">	
<label>Image</label>
	<%= g.file_field :image %>
</div>
<div class="field">
	<%= g.submit 'Create', class: 'ui primary button' %>
</div>
<% end %>
```
#### see app-active-storage/app/views/galleries/show
```
<div class="ui text container">
<h4 class="ui header"><%= @gallery.title %></h4>
<p>
	<%= image_tag @gallery.image, class: 'ui medium rounded image' %>
</p>
<p>
<%= link_to 'Create another gallery', :back, class: 'ui primary button' %>
<%= link_to 'Go to home page', root_url, class: 'ui teal button' %>
</p>
</div>
```

#### see app-active-storage/app/views/galleries/index
```
<div class="ui text container">
<div class="ui items">
<% @ids.each do |x| %>
  <div class="item">
    <div class="image">
      <%= image_tag x.image %>
    </div>
    <div class="content">
      <%= link_to x.title, gallery_url(x), class: 'header' %>
      <div class="meta">
        <span>Description</span>
      </div>
      <div class="description">
        <p></p>
      </div>
      <div class="extra">
        Additional Details
      </div>
    </div>
  </div>
  <% end %>
</div>
  <h4><%= link_to 'Create gallery', new_gallery_url, class: 'ui primary button' %></h4>
</div>
```
#### reference

01.http://edgeguides.rubyonrails.org/active_storage_overview.html
02.https://www.engineyard.com/blog/active-storage
