package hello.repos;

import hello.domain.Orders;
import hello.domain.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface OrderRepository extends JpaRepository<Orders,Long> {
    Orders findOneByOrderId(int id);
    @Modifying
    @Transactional
    @Query(value = "SELECT u FROM Orders u WHERE u.id_ticket = :id_ticket")
    List<Orders> findOrdersById_ticket(@Param("id_ticket") Integer id_ticket);
    }
