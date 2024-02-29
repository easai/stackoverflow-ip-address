SELECT
  pa.id,
  pa.title,
  pa.body,
  pa.accepted_answer_id,
  pa.answer_count,
  pa.comment_count,
  pa.community_owned_date,
  pa.creation_date,
  pa.favorite_count,
  pa.last_activity_date,
  pa.last_edit_date,
  pa.last_editor_display_name,
  pa.last_editor_user_id,
  pa.owner_display_name,
  pa.owner_user_id,
  pa.parent_id,
  pa.post_type_id,
  pa.score,
  pa.tags,
  pa.view_count
FROM
  `bigquery-public-data.stackoverflow.posts_answers` AS pa
JOIN
  `bigquery-public-data.stackoverflow.comments` AS c
ON
  pa.id = c.post_id
WHERE
  REGEXP_CONTAINS(c.text, r"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)")
ORDER BY
  pa.score DESC
LIMIT
  100;
