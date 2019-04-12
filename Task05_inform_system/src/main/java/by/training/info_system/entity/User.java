package by.training.info_system.entity;

import by.training.info_system.entity.role.Role;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode(callSuper = false)
public class User extends Entity {
    @NonNull private String login;
    @NonNull private String password;
    @NonNull private String fName;
    @NonNull private String lName;
    @NonNull private String passportData;
    @NonNull private Integer ordersQuantity;
    @NonNull private Role role;
    @NonNull private Address address;
}
