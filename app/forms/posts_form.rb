class PostsForm
  include ActiveModel::Model
  attr_accessor :content, :name, :user_id, :tag_id, :post_id 

  with_options presence: true do
    validates :content, length: { maximum: 200 }
    validates :name
  end

  delegate :persisted?, to: :post

  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save(tag_list)
    post = Post.create(content: content, user_id:user_id)
    tag_list.each do |new_tag|
      tag = Tag.find_or_create_by(name: new_tag)
      post.tags << tag
    end
    PostTag.create(post_id: post.id, tag_id: tag_id)
  end

  def update(tag_list)
    ActiveRecord::Base.transaction do
      @post.update(content: content, user_id: user_id)
      current_tags = @post.tags.pluck(:name) unless @post.tags.nil?
      old_tags = current_tags - tag_list
      new_tags = tag_list - current_tags

      old_tags.each do |old_name|
        @post.tags.delete Tag.find_by(name: old_name)
      end

      new_tags.each do |new_name|
        tag = Tag.find_or_create_by(name: new_name)
        @post.tags << tag 
        post_tag = PostTag.where(post_id: @post.id, tag_id: tag.id).first_or_initialize
        post_tag.update(post_id: @post.id, tag_id: tag.id)
      end
    end
  end

  def destroy
    form = Post.where(id: post_id)
    form.destroy
  end


  private

  attr_reader :post, :tag
  def default_attributes
    {
      content: post.content,
      name: post.tags.pluck(:name).join(',')
    }
  end

end