package com.java_task.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java_task.entities.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	
}
