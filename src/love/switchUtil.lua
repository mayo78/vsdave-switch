local ffi = require 'ffi'
ffi.include 'switch.h'
ffi.cdef[[
    Result rc=0;

    AccountUid userID={0};
    AccountProfile profile;
    AccountUserData userdata;
    AccountProfileBase profilebase;

    char nickname[0x21];

    /// Initialize account.
    Result accountInitialize(AccountServiceType service_type);

    /// Exit account.
    void accountExit(void);

    /// Gets the Service object for the actual account service session.
    Service* accountGetServiceSession(void);

    /// Get the total number of user profiles.
    Result accountGetUserCount(s32* user_count);

    /**
    * @brief Get a list of all userIds. The returned list will never be larger than ACC_USER_LIST_SIZE.
    * @param uids Pointer to array of userIds.
    * @param max_uids Maximum number of userIds to return.
    * @param actual_total The actual total number of userIds found.
    */
    Result accountListAllUsers(AccountUid* uids, s32 max_uids, s32 *actual_total);

    /// Get the userId for the last opened user.
    Result accountGetLastOpenedUser(AccountUid *uid);

    /// Get an AccountProfile for the specified userId.
    Result accountGetProfile(AccountProfile* out, AccountUid uid);

    /// IsUserRegistrationRequestPermitted
    Result accountIsUserRegistrationRequestPermitted(bool *out);

    /// TrySelectUserWithoutInteraction
    Result accountTrySelectUserWithoutInteraction(AccountUid *uid, bool is_network_service_account_required);

    /// Close the AccountProfile.
    void accountProfileClose(AccountProfile* profile);

    /// Get \ref AccountUserData and \ref AccountProfileBase for the specified profile, userdata is optional (can be NULL).
    Result accountProfileGet(AccountProfile* profile, AccountUserData* userdata, AccountProfileBase* profilebase);

    /// Get the icon image size.
    Result accountProfileGetImageSize(AccountProfile* profile, u32* image_size);

    /// Load the JPEG profile icon, valid for both Miis and character icons. The output image_size is the same as the one from \ref accountProfileGetImageSize.
    Result accountProfileLoadImage(AccountProfile* profile, void* buf, size_t len, u32* image_size);

    /// Gets the userId which was selected by the profile-selector applet (if any), prior to launching the currently running Application.
    /// This gets the cached PreselectedUser loaded during accountInitialize, when PreselectedUser is available.
    Result accountGetPreselectedUser(AccountUid *uid);
]]

local l = {}

function l:getNickname()
    ffi.C.accountInitialize()
    ffi.C.accountGetPreselectedUser(ffi.C.profile, ffi.C.userID)
    ffi.C.accountGetProfile(ffi.C.profile, ffi.C.userID)
    ffi.C.accountProfileGet(ffi.C.profile, ffi.C.userdata, ffi.C.profilebase)
    return ffi.C.profilebase.nickname
end

return l