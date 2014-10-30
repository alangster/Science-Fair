class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :text, presence: true

  def get_all_subcomments
    return recursive_comments(self)
  end

  private
  def recursive_comments(comment, all_comments=[])
    all_comments << comment
    if comment.comments != nil
      comment.comments.each do |children|
        recursive_comments(children, all_comments)
      end
    end
    return all_comments
  end

end
