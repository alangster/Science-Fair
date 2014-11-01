class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  validates :text, presence: true

  def get_all_subcomments
    return recursive_comments(self)
  end

  def get_user_responded_to
    return self.commentable.user.name
  end

  private
  def recursive_comments(comment, all_comments=[])
    if comment.comments != nil
      comment.comments.each do |children|
        all_comments << children
        recursive_comments(children, all_comments)
      end
    else
      all_comments << comment
    end
    return all_comments
  end

end
