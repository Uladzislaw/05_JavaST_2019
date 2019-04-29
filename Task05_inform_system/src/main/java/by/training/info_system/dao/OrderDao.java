package by.training.info_system.dao;

import by.training.info_system.entity.Order;

import java.util.List;
import java.util.Optional;

public interface OrderDao extends Dao<Order> {
    Optional<List<Order>> readCurrentOrders();
    Optional<List<Order>> findOverdue();
}