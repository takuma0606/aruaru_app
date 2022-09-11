class PostsForm
  include ActiveModel::Model
  attr_accessor :content, :name, :user_id, :tag_id, :post_id 

  with_options presence: true do
    validates :content
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


  private

  attr_reader :post, :tag
  def default_attributes
    {
      content: post.content,
      name: post.tags.pluck(:name).join(',')
    }
  end

end