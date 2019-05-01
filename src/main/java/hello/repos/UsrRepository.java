package hello.repos;

import hello.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import hello.domain.Users;

import java.util.List;

public interface UsrRepository extends JpaRepository<Users, Long> {
    /*
     @Query("select u from User u where u.emailAddress = ?1") // МОЖНО ПИСАТЬЬ ЗАПРОСЫ ВРУЧНУЮ!!!!
  User findByEmailAddress(String emailAddress);
     */
    List<Users> findByStatus(String status);
}
