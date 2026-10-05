package com.app.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.model.Attendance;
import com.app.model.Marks;
import com.app.model.Student;

@Controller
public class StudentController {

	List<Student> list = new ArrayList<>();
	List<Attendance> attendanceList = new ArrayList<>();
	List<Marks> marksList = new ArrayList<>();

	// 1.LOGIN
	@RequestMapping("/")
	public String preLogin() {

		return "login";
	}

	// 2.REGISTER
	@RequestMapping("/student-register")
	public String register() {

		return "student-register";

	}

	// 3.STUDENT DASHBOARD
	@RequestMapping("/login")

	public String login(@RequestParam("username") String un, @RequestParam("role") String role,
			@RequestParam("password") String ps, Model model) {

		// ADMIN LOGIN
		if (role.equals("admin")) {

			if (un.equals("Admin@123") && ps.equals("admin@123")) {

				model.addAttribute("students", list);
				model.addAttribute("marksList", marksList);
				model.addAttribute("attendanceList", attendanceList);

				return "adminDashboard";
			}

			model.addAttribute("error", "Invalid Username or Password");

			return "login";

		}

		// TEACHER LOGIN
		if (role.equals("teacher")) {

			if (un.equals("Teacher@123") && ps.equals("teacher@123")) {

				model.addAttribute("students", list);

				return "teacherDashboard";
			}

			model.addAttribute("error", "Invalid Username or Password");

			return "login";
		}

		// STUDENT LOGIN
		if (role.equals("student")) {

			for (Student stu : list) {

				if (stu.getUsername().equals(un) && stu.getPassword().equals(ps)) {

					model.addAttribute("student", stu);
					model.addAttribute("marksList", marksList);
					model.addAttribute("attendanceList", attendanceList);

					return "studentDashboard";
				}
			}

			model.addAttribute("error", "Invalid Username or Password");

			return "login";

		}

		model.addAttribute("error", "Invalid Role");

		return "login";
	}

	// SHOW REGISTERED STUDENT
	@RequestMapping("registerStudent")
	public String registered(@ModelAttribute Student stu, Model model) {

		list.add(stu);

		return "studentDetails";
	}

	@RequestMapping("/logout")
	public String logout() {

		return "logout";
	}

	@RequestMapping("/giveMarks")
	public String giveMarks(@RequestParam("rollno") int rollno, Model model) {

		for (Student stu : list) {

			if (stu.getRollno() == rollno) {

				model.addAttribute("student", stu);

				return "giveMarks";

			}
		}

		return "teacherDashboard";
	}

	@RequestMapping("/saveMarks")
	public String saveMarks(@ModelAttribute Marks mark) {

		marksList.add(mark);

		return "redirect:/teacherDashboard";
	}

	@RequestMapping("/teacherDashboard")
	public String teacherDashboard(Model model) {

		model.addAttribute("students", list);

		return "teacherDashboard";
	}

	@RequestMapping("/markAttendance")
	public String markAtt(@RequestParam("rollno") int rollno, Model model) {

		for (Student stu : list) {

			if (stu.getRollno() == rollno) {

				model.addAttribute("student", stu);

				return "markAttendance";
			}

		}

		return "teacherDashboard";
	}

	@RequestMapping("/saveAttendance")
	public String saveAttendance(@ModelAttribute Attendance attendance) {

		attendanceList.add(attendance);

		return "redirect:/teacherDashboard";
	}

	@RequestMapping("/performance")
	public String performance(@RequestParam("rollno") int rollno, Model model) {

		for (Student stu : list) {

			if (stu.getRollno() == rollno) {

				model.addAttribute("student", stu);
				model.addAttribute("marksList", marksList);
				model.addAttribute("attendanceList", attendanceList);

				return "performance";
			}
		}

		return "login";
	}

	@RequestMapping("/viewAllRecords")
	public String viewAllRecords(Model model) {

		model.addAttribute("students", list);
		model.addAttribute("marksList", marksList);
		model.addAttribute("attendanceList", attendanceList);

		return "viewAllRecords";
	}

	@RequestMapping("/adminDashboard")
	public String adminDashboard() {

		return "adminDashboard";
	}
}
