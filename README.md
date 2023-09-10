# swp391-project

DOCS chia các phần
Context (Bối cảnh): Tại trường FU HCM, việc quản lí lịch thi cho giảng viên và sinh viên gặp nhiều bất cập khi vẫn phải đang dùng giấy thông báo dán ở trước phòng khảo thí, đồng thời không áp dụng công nghệ để quản lí lịch thi, gây ra nhiều vấn đề về tính hiệu quả và tính đáng tin cậy trong quá trình tổ chức các kỳ thi.

Problems:
- Khó khăn trong Quản lý Thời Gian Thi: Giảng viên và sinh viên gặp khó khăn khi phải tự quản lý thời gian canh thi của họ, do thiếu hệ thống hỗ trợ.
- Khó Khăn trong Sắp Xếp Ca Thi cho Giảng Viên: Công tác sắp xếp giảng viên vào các ca thi trở nên khó khăn và tốn nhiều thời gian khi thực hiện thủ công.
- Khó Khăn trong việc Tìm Phòng Thi: Sinh viên gặp khó khăn khi phải tìm phòng thi, do không có hệ thống hỗ trợ cho việc này.
- Rủi Ro của việc Quản lý  bằng thủ Công: Quản lý thủ công dễ dẫn đến những lỗi như trùng lịch thi hoặc đặt phòng bị trùng, gây rối trong quá trình tổ chức thi.
- Tốn Thời Gian: Việc tạo và quản lý bài thi theo cách thủ công đòi hỏi nhiều thời gian, tạo ra sự không hiệu quả trong quá trình tổ chức thi.
- Gian Lận Đổi Lịch Thi và Phòng Thi: Hệ thống hiện tại không đảm bảo tính minh bạch và bảo mật đối với việc đổi lịch thi và phòng thi, dẫn đến nguy cơ gian lận trong quá trình tổ chức thi.
  
Solution
Hệ thống Quản lý Lịch Thi (ESMS): Triển khai một Hệ thống Quản lý Lịch Thi (ESMS) hiện đại và đa năng. Hệ thống này sẽ cung cấp một loạt các tính năng, bao gồm:

-	Lập lịch tự động: Tự động lập lịch thi dựa trên các yếu tố như số lượng sinh viên, giảng viên, và phòng thi.

Thông báo tự động: Gửi thông báo tự động cho giảng viên và sinh viên về lịch thi và các thay đổi liên quan.

Sắp xếp ca thi: Hỗ trợ quản lý sắp xếp ca thi cho giảng viên một cách hiệu quả, giúp tránh xung đột và trùng lịch.

Tìm kiếm phòng thi: Cung cấp công cụ tìm kiếm thông minh để giúp sinh viên dễ dàng tìm phòng thi và địa điểm thi.

Minh bạch và Bảo mật: Đảm bảo tính minh bạch và bảo mật thông tin liên quan đến lịch thi, ngăn chặn việc gian lận và thay đổi lịch thi một cách trái quy định.

Main Actors:
Testing Staff
Lecturer
Student
Testing Admin
Admin
Main Features of each actor

Feature: Who - action - [Entity]

5.1 Testing Admin:

Tạo Ca Thi: Testing Admin có thể tạo mới hoặc import thông tin về các ca thi. (Entity: Exam Schedule)

Quản Lý Ca Thi: Có khả năng quản lý chi tiết của các ca thi, bao gồm chỉnh sửa, xóa, và cập nhật thông tin. (Entity: Exam Schedule)

Thêm Sinh Viên và Giảng Viên: Testing Admin có thể thêm sinh viên và giảng viên vào danh sách tham gia lịch thi. (Entities: Student, Teacher)

Dashboard Theo Dõi: Hiển thị thông tin theo dõi về thời gian coi thi, phụ cấp theo thời gian, theo giảng viên. (Entities: Exam Schedule, Teacher)

5.2 Testing Staff:

Tìm Kiếm Thông Tin Ca Thi: Testing Staff có thể tìm kiếm thông tin về các ca thi dựa trên tiêu chí như thời gian, giảng viên, hoặc môn học. (Entities: Exam Schedule, Teacher, Subject)

Xuất Thông Tin Ra File Excel: Có khả năng xuất thông tin về các ca thi ra file Excel. (Entity: Exam Schedule)

5.3 Student:

Xem Thông Tin Ca Thi: Sinh viên có thể xem thông tin chi tiết về các ca thi mà họ tham gia. (Entity: Exam Schedule)

Tìm Kiếm Ca Thi: Có thể tìm kiếm các ca thi dựa trên tiêu chí như thời gian, giảng viên, hoặc môn học. (Entities: Exam Schedule, Teacher, Subject)

Cập Nhật Thông Tin: Sinh viên có thể cập nhật một số thông tin không phải là thông tin trường key. (Entity: Student)

5.4 Teacher:

Đăng Ký Lịch Coi Thi: Giảng viên có thể đăng ký lịch coi thi của họ thông qua hệ thống. (Entities: Exam Schedule, Teacher)

Thống Kê Số Lượng Coi Thi: Giảng viên có thể thống kê số lượng coi thi hiện tại, số lượng coi thi chưa coi, và phụ cấp coi thi của họ. (Entities: Teacher, Exam Schedule)

Xem Thông Tin Lịch Coi Thi: Có khả năng xem thông tin chi tiết về lịch coi thi của mình. (Entities: Teacher, Exam Schedule)

5.5 Admin:

Toàn Quyền Quản Trị Hệ Thống: Admin có quyền quản trị cao nhất trong hệ thống, bao gồm quản lý tài khoản và cấu hình các thông số. (Entities: User Accounts, System Configuration)

Các Yêu Cầu Không Chức Năng:

Lên Lịch Trước Ngày Bắt Đầu: Hệ thống cho phép lên lịch thi trước ngày bắt đầu của ca thi.

Thông Báo qua Email: Gửi thông báo qua email cho giảng viên và sinh viên 24 giờ trước thời gian thi.

Phụ Cấp Coi Thi: Tính phụ cấp coi thi dựa trên thời gian (theo quy định cụ thể), và có tính theo tháng.

Thời Gian Lên Lịch và Huỷ Lịch: Thời gian lên lịch thi trước 7 ngày và thời gian cho phép giảng viên huỷ lịch là 3 ngày, có thể được cấu hình bởi Admin.

Phụ Cấp Coi Thi: Phụ cấp coi thi 1 giờ là 100.000 VNĐ và có khả năng thay đổi trong tương lai.

Khoảng Cách Giữa Các Ca Thi: Mỗi ca thi cách nhau 15 phút để đảm bảo không có xung đột thời gian giữa các ca thi.


