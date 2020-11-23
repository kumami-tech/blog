json.nickname  @comment.user.name
json.content  @comment.content
json.created_at @comment.created_at.strftime("%Y年%-m月%-d日 %-H:%M")