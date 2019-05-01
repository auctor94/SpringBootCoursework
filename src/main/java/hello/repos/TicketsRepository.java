package hello.repos;

import hello.domain.Tickets;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketsRepository extends JpaRepository<Tickets, Long> {
    Tickets findOneByTicketId(int id);
}
