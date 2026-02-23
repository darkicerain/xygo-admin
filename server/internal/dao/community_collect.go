package dao

import (
	"xygo/internal/dao/internal"
)

// communityCollectDao is the data access object for the table xy_community_collect.
type communityCollectDao struct {
	*internal.CommunityCollectDao
}

var (
	// CommunityCollect is a globally accessible object for table xy_community_collect operations.
	CommunityCollect = communityCollectDao{internal.NewCommunityCollectDao()}
)
