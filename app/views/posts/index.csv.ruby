require 'csv'

CSV.generate do |csv|
  csv_column_names = %w(title content image created_at)
  csv << csv_column_names
  @posts.each do |post|
    csv_column_values = [
      post.title,
      post.content,
      post.image,
      post.created_at
    ]
    csv << csv_column_values
  end
end