package com.java_task.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.java_task.entities.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	//List<Employee>findByName(String name);
	@Query("SELECT a FROM Employee a WHERE a.name LIKE %:letter%")
	List<Employee> findByName(@Param("letter") String letter);
}
