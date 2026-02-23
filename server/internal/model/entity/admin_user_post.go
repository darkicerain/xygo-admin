// =================================================================================
// Code generated and maintained by GoFrame CLI tool. DO NOT EDIT.
// =================================================================================

package entity

// AdminUserPost is the golang structure for table admin_user_post.
type AdminUserPost struct {
	UserId uint64 `json:"userId" orm:"user_id" description:"用户ID"` // 用户ID
	PostId uint64 `json:"postId" orm:"post_id" description:"岗位ID"` // 岗位ID
}
