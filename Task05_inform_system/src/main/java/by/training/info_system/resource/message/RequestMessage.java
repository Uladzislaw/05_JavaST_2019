package by.training.info_system.resource.message;

import by.training.info_system.resource.RequestMessageManager;

public enum RequestMessage {
    INCORRECT_SIGNIN(RequestMessageManager.getInstance()
            .getProperty("incorrect_signin")),
    BANNED_ACCOUNT(RequestMessageManager.getInstance()
            .getProperty("banned_account")),
    INCORRECT_SIGNUP_FORM(RequestMessageManager.getInstance()
            .getProperty("incorrect_signup_form")),
    SUCCESSFUL_SIGNUP(RequestMessageManager.getInstance()
            .getProperty("successful_signup")),
    USER_WITH_PASSPORT_EXIST(RequestMessageManager.getInstance()
            .getProperty("user_with_passport_exist")),
    BANNED_ACCOUNT_EXIST(RequestMessageManager.getInstance()
            .getProperty("banned_account_exist")),
    MORE_SECURE(RequestMessageManager.getInstance()
            .getProperty("more_secure")),
    ORDER_WAIT(RequestMessageManager.getInstance()
            .getProperty("order_wait")),
    ORDER_GOES_WRONG(RequestMessageManager.getInstance()
            .getProperty("order_goes_wrong")),
    ACTIVE_ORDER(RequestMessageManager.getInstance()
            .getProperty("active_order")),
    SIGNIN_TO_RENT(RequestMessageManager.getInstance()
            .getProperty("signin_to_rent")),
    DENIED_ORDER(RequestMessageManager.getInstance()
            .getProperty("denied_order")),
    CONFIRMED_ORDER(RequestMessageManager.getInstance()
            .getProperty("confirmed_order")),
    UPDATED_ORDER_STATUS_WRONG(RequestMessageManager.getInstance()
            .getProperty("update_order_status_wrong")),
    USER_TOOK_A_CAR(RequestMessageManager.getInstance()
            .getProperty("user_took_car")),
    TOOK_A_CAR_GOES_WRONG(RequestMessageManager.getInstance()
            .getProperty("user_took_goes_wrong")),
    EXTENDED_ORDER(RequestMessageManager.getInstance()
            .getProperty("extended_order")),
    EXTEND_GOES_WRONG(RequestMessageManager.getInstance()
            .getProperty("extend_goes_wrong")),
    COMPLETED_USER_ORDER(RequestMessageManager.getInstance()
            .getProperty("completed_user_order")),
    EMAIL_CHANGED(RequestMessageManager.getInstance()
            .getProperty("email_changed")),
    INCORRECT_EMAIL(RequestMessageManager.getInstance()
            .getProperty("incorrect_email")),
    PASSWORD_CHANGED(RequestMessageManager.getInstance()
            .getProperty("password_changed")),
    PASSWORDS_INCORRECT(RequestMessageManager.getInstance()
            .getProperty("incorrect_password")),
    EMAIL_CHANGE_GOES_WRONG(RequestMessageManager.getInstance()
            .getProperty("password_change_goes_wrong")),
    PASSWORD_CHANGE_GOES_WRONG(RequestMessageManager.getInstance()
            .getProperty("password_change_goes_wrong")),
    USER_IN_BLACK_LIST(RequestMessageManager.getInstance()
            .getProperty("user_in_black_list")),
    ADMIN_CANNOT_RENT(RequestMessageManager.getInstance()
            .getProperty("admin_cannot_rent")),
    CAR_ADDED(RequestMessageManager.getInstance()
            .getProperty("car_added")),
    USER_EXISTS(RequestMessageManager.getInstance()
            .getProperty("user_exists")),
    INCORRECT_CAR_ADD_FORM(RequestMessageManager.getInstance()
            .getProperty("incorrect_car_form"));


    private String value;

    RequestMessage(final String val) {
        this.value = val;
    }

    public String getValue() {
        return value;
    }
}
