package com.java_task.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.java_task.entities.Employee;
import com.java_task.exception.GlobalExceptionClass;
import com.java_task.exception.ResourceNotFoundException;
import com.java_task.payload.PostResponse;
import com.java_task.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public void saveEmployee(Employee employee) {
		employeeRepository.save(employee);
		
	}
	
	@Override
	public List<Employee> showAllEmployees() {
		List<Employee> list = employeeRepository.findAll();
		return list;
	}

	@Override
	public PostResponse showAllEmployees(int pageNo,int pageSize) {
		Pageable pageable = PageRequest.of(pageNo, pageSize);
        Page<Employee> listOfEmployees = employeeRepository.findAll(pageable);
        List<Employee> employees = listOfEmployees.getContent();
        //List<Employee> list = employees.stream().map(x -> mapToDto(x)).collect(Collectors.toList());
        PostResponse postResponse= new PostResponse();
        postResponse.setContent(employees);
        postResponse.setPageNo(listOfEmployees.getNumber());
        postResponse.setPageSize(listOfEmployees.getSize());
        postResponse.setTotalElements(listOfEmployees.getNumberOfElements());
        postResponse.setTotalPages(listOfEmployees.getTotalPages());
        postResponse.setLast(listOfEmployees.isLast());
        return postResponse;
	}

	@Override
	public void deleteById(long id) {
		employeeRepository.deleteById(id);
		
	}

	@Override
	public Employee updateEmployee(long id) {
		Optional<Employee> findById = employeeRepository.findById(id);
		Employee employee = findById.get();
		return employee;
	}

	@Override
	public List<Employee> searchByName(String name) {
		  List<Employee> records = employeeRepository.findByName(name);
		  if(records.isEmpty()) {
				throw new ResourceNotFoundException("employee", "name", name);
		  }
		return records;
		
	}

}
