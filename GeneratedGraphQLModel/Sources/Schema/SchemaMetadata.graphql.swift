// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GeneratedGraphQLModel.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GeneratedGraphQLModel.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GeneratedGraphQLModel.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GeneratedGraphQLModel.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GeneratedGraphQLModel.Objects.Query
    case "SearchResultItemConnection": return GeneratedGraphQLModel.Objects.SearchResultItemConnection
    case "SearchResultItemEdge": return GeneratedGraphQLModel.Objects.SearchResultItemEdge
    case "App": return GeneratedGraphQLModel.Objects.App
    case "AddedToMergeQueueEvent": return GeneratedGraphQLModel.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GeneratedGraphQLModel.Objects.AddedToProjectEvent
    case "AssignedEvent": return GeneratedGraphQLModel.Objects.AssignedEvent
    case "AutoMergeDisabledEvent": return GeneratedGraphQLModel.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GeneratedGraphQLModel.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GeneratedGraphQLModel.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GeneratedGraphQLModel.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GeneratedGraphQLModel.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GeneratedGraphQLModel.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GeneratedGraphQLModel.Objects.BaseRefChangedEvent
    case "BaseRefDeletedEvent": return GeneratedGraphQLModel.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GeneratedGraphQLModel.Objects.BaseRefForcePushedEvent
    case "Blob": return GeneratedGraphQLModel.Objects.Blob
    case "Commit": return GeneratedGraphQLModel.Objects.Commit
    case "Discussion": return GeneratedGraphQLModel.Objects.Discussion
    case "Issue": return GeneratedGraphQLModel.Objects.Issue
    case "PullRequest": return GeneratedGraphQLModel.Objects.PullRequest
    case "CommitComment": return GeneratedGraphQLModel.Objects.CommitComment
    case "DiscussionComment": return GeneratedGraphQLModel.Objects.DiscussionComment
    case "GistComment": return GeneratedGraphQLModel.Objects.GistComment
    case "IssueComment": return GeneratedGraphQLModel.Objects.IssueComment
    case "PullRequestReview": return GeneratedGraphQLModel.Objects.PullRequestReview
    case "CommitCommentThread": return GeneratedGraphQLModel.Objects.CommitCommentThread
    case "DependabotUpdate": return GeneratedGraphQLModel.Objects.DependabotUpdate
    case "DiscussionCategory": return GeneratedGraphQLModel.Objects.DiscussionCategory
    case "PinnedDiscussion": return GeneratedGraphQLModel.Objects.PinnedDiscussion
    case "PullRequestCommitCommentThread": return GeneratedGraphQLModel.Objects.PullRequestCommitCommentThread
    case "PullRequestReviewComment": return GeneratedGraphQLModel.Objects.PullRequestReviewComment
    case "TeamDiscussion": return GeneratedGraphQLModel.Objects.TeamDiscussion
    case "Bot": return GeneratedGraphQLModel.Objects.Bot
    case "EnterpriseUserAccount": return GeneratedGraphQLModel.Objects.EnterpriseUserAccount
    case "Mannequin": return GeneratedGraphQLModel.Objects.Mannequin
    case "Organization": return GeneratedGraphQLModel.Objects.Organization
    case "Enterprise": return GeneratedGraphQLModel.Objects.Enterprise
    case "Team": return GeneratedGraphQLModel.Objects.Team
    case "Repository": return GeneratedGraphQLModel.Objects.Repository
    case "User": return GeneratedGraphQLModel.Objects.User
    case "Gist": return GeneratedGraphQLModel.Objects.Gist
    case "Topic": return GeneratedGraphQLModel.Objects.Topic
    case "CheckRun": return GeneratedGraphQLModel.Objects.CheckRun
    case "StatusContext": return GeneratedGraphQLModel.Objects.StatusContext
    case "ClosedEvent": return GeneratedGraphQLModel.Objects.ClosedEvent
    case "ConvertToDraftEvent": return GeneratedGraphQLModel.Objects.ConvertToDraftEvent
    case "CrossReferencedEvent": return GeneratedGraphQLModel.Objects.CrossReferencedEvent
    case "MergedEvent": return GeneratedGraphQLModel.Objects.MergedEvent
    case "Milestone": return GeneratedGraphQLModel.Objects.Milestone
    case "PullRequestCommit": return GeneratedGraphQLModel.Objects.PullRequestCommit
    case "ReadyForReviewEvent": return GeneratedGraphQLModel.Objects.ReadyForReviewEvent
    case "Release": return GeneratedGraphQLModel.Objects.Release
    case "RepositoryTopic": return GeneratedGraphQLModel.Objects.RepositoryTopic
    case "ReviewDismissedEvent": return GeneratedGraphQLModel.Objects.ReviewDismissedEvent
    case "TeamDiscussionComment": return GeneratedGraphQLModel.Objects.TeamDiscussionComment
    case "Workflow": return GeneratedGraphQLModel.Objects.Workflow
    case "WorkflowRun": return GeneratedGraphQLModel.Objects.WorkflowRun
    case "WorkflowRunFile": return GeneratedGraphQLModel.Objects.WorkflowRunFile
    case "RepositoryVulnerabilityAlert": return GeneratedGraphQLModel.Objects.RepositoryVulnerabilityAlert
    case "Project": return GeneratedGraphQLModel.Objects.Project
    case "ProjectV2": return GeneratedGraphQLModel.Objects.ProjectV2
    case "Tag": return GeneratedGraphQLModel.Objects.Tag
    case "Tree": return GeneratedGraphQLModel.Objects.Tree
    case "BranchProtectionRule": return GeneratedGraphQLModel.Objects.BranchProtectionRule
    case "BypassForcePushAllowance": return GeneratedGraphQLModel.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GeneratedGraphQLModel.Objects.BypassPullRequestAllowance
    case "CWE": return GeneratedGraphQLModel.Objects.CWE
    case "CheckSuite": return GeneratedGraphQLModel.Objects.CheckSuite
    case "CodeOfConduct": return GeneratedGraphQLModel.Objects.CodeOfConduct
    case "CommentDeletedEvent": return GeneratedGraphQLModel.Objects.CommentDeletedEvent
    case "Comparison": return GeneratedGraphQLModel.Objects.Comparison
    case "ConnectedEvent": return GeneratedGraphQLModel.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GeneratedGraphQLModel.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GeneratedGraphQLModel.Objects.ConvertedToDiscussionEvent
    case "DemilestonedEvent": return GeneratedGraphQLModel.Objects.DemilestonedEvent
    case "DependencyGraphManifest": return GeneratedGraphQLModel.Objects.DependencyGraphManifest
    case "DeployKey": return GeneratedGraphQLModel.Objects.DeployKey
    case "DeployedEvent": return GeneratedGraphQLModel.Objects.DeployedEvent
    case "Deployment": return GeneratedGraphQLModel.Objects.Deployment
    case "DeploymentEnvironmentChangedEvent": return GeneratedGraphQLModel.Objects.DeploymentEnvironmentChangedEvent
    case "DeploymentReview": return GeneratedGraphQLModel.Objects.DeploymentReview
    case "DeploymentStatus": return GeneratedGraphQLModel.Objects.DeploymentStatus
    case "DisconnectedEvent": return GeneratedGraphQLModel.Objects.DisconnectedEvent
    case "DiscussionPoll": return GeneratedGraphQLModel.Objects.DiscussionPoll
    case "DiscussionPollOption": return GeneratedGraphQLModel.Objects.DiscussionPollOption
    case "DraftIssue": return GeneratedGraphQLModel.Objects.DraftIssue
    case "EnterpriseAdministratorInvitation": return GeneratedGraphQLModel.Objects.EnterpriseAdministratorInvitation
    case "EnterpriseIdentityProvider": return GeneratedGraphQLModel.Objects.EnterpriseIdentityProvider
    case "EnterpriseRepositoryInfo": return GeneratedGraphQLModel.Objects.EnterpriseRepositoryInfo
    case "EnterpriseServerInstallation": return GeneratedGraphQLModel.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GeneratedGraphQLModel.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GeneratedGraphQLModel.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GeneratedGraphQLModel.Objects.EnterpriseServerUserAccountsUpload
    case "Environment": return GeneratedGraphQLModel.Objects.Environment
    case "ExternalIdentity": return GeneratedGraphQLModel.Objects.ExternalIdentity
    case "HeadRefDeletedEvent": return GeneratedGraphQLModel.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GeneratedGraphQLModel.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GeneratedGraphQLModel.Objects.HeadRefRestoredEvent
    case "IpAllowListEntry": return GeneratedGraphQLModel.Objects.IpAllowListEntry
    case "Label": return GeneratedGraphQLModel.Objects.Label
    case "LabeledEvent": return GeneratedGraphQLModel.Objects.LabeledEvent
    case "Language": return GeneratedGraphQLModel.Objects.Language
    case "License": return GeneratedGraphQLModel.Objects.License
    case "LinkedBranch": return GeneratedGraphQLModel.Objects.LinkedBranch
    case "LockedEvent": return GeneratedGraphQLModel.Objects.LockedEvent
    case "MarkedAsDuplicateEvent": return GeneratedGraphQLModel.Objects.MarkedAsDuplicateEvent
    case "MarketplaceCategory": return GeneratedGraphQLModel.Objects.MarketplaceCategory
    case "MarketplaceListing": return GeneratedGraphQLModel.Objects.MarketplaceListing
    case "MembersCanDeleteReposClearAuditEntry": return GeneratedGraphQLModel.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GeneratedGraphQLModel.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GeneratedGraphQLModel.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GeneratedGraphQLModel.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GeneratedGraphQLModel.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessBlockedAuditEntry": return GeneratedGraphQLModel.Objects.OrgOauthAppAccessBlockedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GeneratedGraphQLModel.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GeneratedGraphQLModel.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgOauthAppAccessUnblockedAuditEntry": return GeneratedGraphQLModel.Objects.OrgOauthAppAccessUnblockedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GeneratedGraphQLModel.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GeneratedGraphQLModel.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GeneratedGraphQLModel.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GeneratedGraphQLModel.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GeneratedGraphQLModel.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GeneratedGraphQLModel.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GeneratedGraphQLModel.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GeneratedGraphQLModel.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GeneratedGraphQLModel.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GeneratedGraphQLModel.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GeneratedGraphQLModel.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GeneratedGraphQLModel.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GeneratedGraphQLModel.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GeneratedGraphQLModel.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GeneratedGraphQLModel.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GeneratedGraphQLModel.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GeneratedGraphQLModel.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GeneratedGraphQLModel.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GeneratedGraphQLModel.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GeneratedGraphQLModel.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GeneratedGraphQLModel.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GeneratedGraphQLModel.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GeneratedGraphQLModel.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GeneratedGraphQLModel.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GeneratedGraphQLModel.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GeneratedGraphQLModel.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GeneratedGraphQLModel.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GeneratedGraphQLModel.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GeneratedGraphQLModel.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GeneratedGraphQLModel.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GeneratedGraphQLModel.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GeneratedGraphQLModel.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GeneratedGraphQLModel.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GeneratedGraphQLModel.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GeneratedGraphQLModel.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GeneratedGraphQLModel.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GeneratedGraphQLModel.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GeneratedGraphQLModel.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GeneratedGraphQLModel.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GeneratedGraphQLModel.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GeneratedGraphQLModel.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GeneratedGraphQLModel.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GeneratedGraphQLModel.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "MentionedEvent": return GeneratedGraphQLModel.Objects.MentionedEvent
    case "MergeQueue": return GeneratedGraphQLModel.Objects.MergeQueue
    case "MergeQueueEntry": return GeneratedGraphQLModel.Objects.MergeQueueEntry
    case "MigrationSource": return GeneratedGraphQLModel.Objects.MigrationSource
    case "MilestonedEvent": return GeneratedGraphQLModel.Objects.MilestonedEvent
    case "MovedColumnsInProjectEvent": return GeneratedGraphQLModel.Objects.MovedColumnsInProjectEvent
    case "OIDCProvider": return GeneratedGraphQLModel.Objects.OIDCProvider
    case "OrganizationIdentityProvider": return GeneratedGraphQLModel.Objects.OrganizationIdentityProvider
    case "OrganizationInvitation": return GeneratedGraphQLModel.Objects.OrganizationInvitation
    case "OrganizationMigration": return GeneratedGraphQLModel.Objects.OrganizationMigration
    case "Package": return GeneratedGraphQLModel.Objects.Package
    case "PackageFile": return GeneratedGraphQLModel.Objects.PackageFile
    case "PackageTag": return GeneratedGraphQLModel.Objects.PackageTag
    case "PackageVersion": return GeneratedGraphQLModel.Objects.PackageVersion
    case "PinnedEvent": return GeneratedGraphQLModel.Objects.PinnedEvent
    case "PinnedIssue": return GeneratedGraphQLModel.Objects.PinnedIssue
    case "ProjectCard": return GeneratedGraphQLModel.Objects.ProjectCard
    case "ProjectColumn": return GeneratedGraphQLModel.Objects.ProjectColumn
    case "ProjectV2Field": return GeneratedGraphQLModel.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GeneratedGraphQLModel.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GeneratedGraphQLModel.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GeneratedGraphQLModel.Objects.ProjectV2Item
    case "ProjectV2ItemFieldDateValue": return GeneratedGraphQLModel.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GeneratedGraphQLModel.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GeneratedGraphQLModel.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GeneratedGraphQLModel.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GeneratedGraphQLModel.Objects.ProjectV2ItemFieldTextValue
    case "ProjectV2View": return GeneratedGraphQLModel.Objects.ProjectV2View
    case "ProjectV2Workflow": return GeneratedGraphQLModel.Objects.ProjectV2Workflow
    case "PublicKey": return GeneratedGraphQLModel.Objects.PublicKey
    case "PullRequestReviewThread": return GeneratedGraphQLModel.Objects.PullRequestReviewThread
    case "PullRequestThread": return GeneratedGraphQLModel.Objects.PullRequestThread
    case "Push": return GeneratedGraphQLModel.Objects.Push
    case "PushAllowance": return GeneratedGraphQLModel.Objects.PushAllowance
    case "Reaction": return GeneratedGraphQLModel.Objects.Reaction
    case "Ref": return GeneratedGraphQLModel.Objects.Ref
    case "ReferencedEvent": return GeneratedGraphQLModel.Objects.ReferencedEvent
    case "ReleaseAsset": return GeneratedGraphQLModel.Objects.ReleaseAsset
    case "RemovedFromMergeQueueEvent": return GeneratedGraphQLModel.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GeneratedGraphQLModel.Objects.RemovedFromProjectEvent
    case "RenamedTitleEvent": return GeneratedGraphQLModel.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GeneratedGraphQLModel.Objects.ReopenedEvent
    case "RepositoryInvitation": return GeneratedGraphQLModel.Objects.RepositoryInvitation
    case "RepositoryMigration": return GeneratedGraphQLModel.Objects.RepositoryMigration
    case "RepositoryRule": return GeneratedGraphQLModel.Objects.RepositoryRule
    case "RepositoryRuleset": return GeneratedGraphQLModel.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GeneratedGraphQLModel.Objects.RepositoryRulesetBypassActor
    case "ReviewDismissalAllowance": return GeneratedGraphQLModel.Objects.ReviewDismissalAllowance
    case "ReviewRequest": return GeneratedGraphQLModel.Objects.ReviewRequest
    case "ReviewRequestRemovedEvent": return GeneratedGraphQLModel.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GeneratedGraphQLModel.Objects.ReviewRequestedEvent
    case "SavedReply": return GeneratedGraphQLModel.Objects.SavedReply
    case "SecurityAdvisory": return GeneratedGraphQLModel.Objects.SecurityAdvisory
    case "SponsorsActivity": return GeneratedGraphQLModel.Objects.SponsorsActivity
    case "SponsorsListing": return GeneratedGraphQLModel.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GeneratedGraphQLModel.Objects.SponsorsListingFeaturedItem
    case "SponsorsTier": return GeneratedGraphQLModel.Objects.SponsorsTier
    case "Sponsorship": return GeneratedGraphQLModel.Objects.Sponsorship
    case "SponsorshipNewsletter": return GeneratedGraphQLModel.Objects.SponsorshipNewsletter
    case "Status": return GeneratedGraphQLModel.Objects.Status
    case "StatusCheckRollup": return GeneratedGraphQLModel.Objects.StatusCheckRollup
    case "SubscribedEvent": return GeneratedGraphQLModel.Objects.SubscribedEvent
    case "TransferredEvent": return GeneratedGraphQLModel.Objects.TransferredEvent
    case "UnassignedEvent": return GeneratedGraphQLModel.Objects.UnassignedEvent
    case "UnlabeledEvent": return GeneratedGraphQLModel.Objects.UnlabeledEvent
    case "UnlockedEvent": return GeneratedGraphQLModel.Objects.UnlockedEvent
    case "UnmarkedAsDuplicateEvent": return GeneratedGraphQLModel.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GeneratedGraphQLModel.Objects.UnpinnedEvent
    case "UnsubscribedEvent": return GeneratedGraphQLModel.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GeneratedGraphQLModel.Objects.UserBlockedEvent
    case "UserContentEdit": return GeneratedGraphQLModel.Objects.UserContentEdit
    case "UserStatus": return GeneratedGraphQLModel.Objects.UserStatus
    case "VerifiableDomain": return GeneratedGraphQLModel.Objects.VerifiableDomain
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
