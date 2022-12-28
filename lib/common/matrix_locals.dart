import 'package:matrix/matrix.dart';

/// This is a temporary helper class until there is a proper solution to this with the new system
class MatrixLocals extends MatrixLocalizations {

  MatrixLocals();

  @override
  String acceptedTheInvitation(String targetName) {
    return 'acceptedTheInvitation(targetName)';
  }

  @override
  String activatedEndToEndEncryption(String senderName) {
    return 'activatedEndToEndEncryption(senderName)';
  }

  @override
  String answeredTheCall(String senderName) {
    return 'answeredTheCall(senderName)';
  }

  @override
  String get anyoneCanJoin => 'anyoneCanJoin';

  @override
  String bannedUser(String senderName, String targetName) {
    return 'bannedUser(senderName, targetName)';
  }

  @override
  String changedTheChatAvatar(String senderName) {
    return 'changedTheChatAvatar(senderName)';
  }

  @override
  String changedTheChatDescriptionTo(String senderName, String content) {
    return 'changedTheChatDescriptionTo(senderName, content)';
  }

  @override
  String changedTheChatNameTo(String senderName, String content) {
    return 'changedTheChatNameTo(senderName, content)';
  }

  @override
  String changedTheChatPermissions(String senderName) {
    return 'changedTheChatPermissions(senderName)';
  }

  @override
  String changedTheDisplaynameTo(String targetName, String newDisplayname) {
    return 'changedTheDisplaynameTo(targetName, newDisplayname)';
  }

  @override
  String changedTheGuestAccessRules(String senderName) {
    return 'changedTheGuestAccessRules(senderName)';
  }

  @override
  String changedTheGuestAccessRulesTo(
      String senderName, String localizedString) {
    return 'changedTheGuestAccessRulesTo(senderName, localizedString)';
  }

  @override
  String changedTheHistoryVisibility(String senderName) {
    return 'changedTheHistoryVisibility(senderName)';
  }

  @override
  String changedTheHistoryVisibilityTo(
      String senderName, String localizedString) {
    return 'changedTheHistoryVisibilityTo(senderName, localizedString)';
  }

  @override
  String changedTheJoinRules(String senderName) {
    return 'changedTheJoinRules(senderName)';
  }

  @override
  String changedTheJoinRulesTo(String senderName, String localizedString) {
    return 'changedTheJoinRulesTo(senderName, localizedString)';
  }

  @override
  String changedTheProfileAvatar(String targetName) {
    return 'changedTheProfileAvatar(targetName)';
  }

  @override
  String changedTheRoomAliases(String senderName) {
    return 'changedTheRoomAliases(senderName)';
  }

  @override
  String changedTheRoomInvitationLink(String senderName) {
    return 'changedTheRoomInvitationLink(senderName)';
  }

  @override
  String get channelCorruptedDecryptError => 'channelCorruptedDecryptError';

  @override
  String couldNotDecryptMessage(String errorText) {
    return 'couldNotDecryptMessage(errorText)';
  }

  @override
  String createdTheChat(String senderName) {
    return 'createdTheChat(senderName)';
  }

  @override
  String get emptyChat => 'emptyChat';

  @override
  String get encryptionNotEnabled => 'encryptionNotEnabled';

  @override
  String endedTheCall(String senderName) {
    return 'endedTheCall(senderName)';
  }

  @override
  String get fromJoining => 'fromJoining';

  @override
  String get fromTheInvitation => 'fromTheInvitation';

  @override
  String groupWith(String displayname) {
    return 'groupWith(displayname)';
  }

  @override
  String get guestsAreForbidden => 'guestsAreForbidden';

  @override
  String get guestsCanJoin => 'guestsCanJoin';

  @override
  String hasWithdrawnTheInvitationFor(String senderName, String targetName) {
    return 'hasWithdrawnTheInvitationFor(senderName, targetName)';
  }

  @override
  String invitedUser(String senderName, String targetName) {
    return 'invitedUser(senderName, targetName)';
  }

  @override
  String get invitedUsersOnly => 'invitedUsersOnly';

  @override
  String joinedTheChat(String targetName) {
    return 'joinedTheChat(targetName)';
  }

  @override
  String kicked(String senderName, String targetName) {
    return 'kicked(senderName, targetName)';
  }

  @override
  String kickedAndBanned(String senderName, String targetName) {
    return 'kickedAndBanned(senderName, targetName)';
  }

  @override
  String get needPantalaimonWarning => 'needPantalaimonWarning';

  @override
  String get noPermission => 'noKeyForThisMessage';

  @override
  String redactedAnEvent(String senderName) {
    return 'redactedAnEvent(senderName)';
  }

  @override
  String rejectedTheInvitation(String targetName) {
    return 'rejectedTheInvitation(targetName)';
  }

  @override
  String removedBy(String calcDisplayname) {
    return 'removedBy(calcDisplayname)';
  }

  @override
  String get roomHasBeenUpgraded => 'roomHasBeenUpgraded';

  @override
  String sentAFile(String senderName) {
    return 'sentAFile(senderName)';
  }

  @override
  String sentAPicture(String senderName) {
    return 'sentAPicture(senderName)';
  }

  @override
  String sentASticker(String senderName) {
    return 'sentASticker(senderName)';
  }

  @override
  String sentAVideo(String senderName) {
    return 'sentAVideo(senderName)';
  }

  @override
  String sentAnAudio(String senderName) {
    return 'sentAnAudio(senderName)';
  }

  @override
  String sentCallInformations(String senderName) {
    return 'sentCallInformations(senderName)';
  }

  @override
  String sharedTheLocation(String senderName) {
    return 'sharedTheLocation(senderName)';
  }

  @override
  String startedACall(String senderName) {
    return 'startedACall(senderName)';
  }

  @override
  String unbannedUser(String senderName, String targetName) {
    return 'unbannedUser(senderName, targetName)';
  }

  @override
  String get unknownEncryptionAlgorithm => 'unknownEncryptionAlgorithm';

  @override
  String unknownEvent(String typeKey) {
    return 'unknownEvent(typeKey)';
  }

  @override
  String userLeftTheChat(String targetName) {
    return 'userLeftTheChat(targetName)';
  }

  @override
  String get visibleForAllParticipants => 'visibleForAllParticipants';

  @override
  String get visibleForEveryone => 'visibleForEveryone';

  @override
  String get you => 'you';

  @override
  String sentReaction(String senderName, String reactionKey) =>
      'reactedWith(senderName, reactionKey)';

  @override
  // TODO: implement youAcceptedTheInvitation
  String get youAcceptedTheInvitation => 'youAcceptedTheInvitation';

  @override
  String youBannedUser(String targetName) => 'youBannedUser(targetName)';

  @override
  String youHaveWithdrawnTheInvitationFor(String targetName) =>
      'youHaveWithdrawnTheInvitationFor(targetName)';

  @override
  String youInvitedBy(String senderName) => 'youInvitedBy(senderName)';

  @override
  String youInvitedUser(String targetName) => 'youInvitedUser(targetName)';

  @override
  // TODO: implement youJoinedTheChat
  String get youJoinedTheChat => 'youJoinedTheChat';

  @override
  String youKicked(String targetName) => 'youKicked(targetName)';

  @override
  String youKickedAndBanned(String targetName) =>
      'youKickedAndBanned(targetName)';

  @override
  // TODO: implement youRejectedTheInvitation
  String get youRejectedTheInvitation => 'youRejectedTheInvitation';

  @override
  String youUnbannedUser(String targetName) => 'youUnbannedUser(targetName)';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return '';
    
  }
}
