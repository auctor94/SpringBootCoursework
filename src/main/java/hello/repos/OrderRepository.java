package hello.repos;

import hello.domain.Orders;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Orders,Long> {
    Orders findOneByOrderId(int id);
    }
