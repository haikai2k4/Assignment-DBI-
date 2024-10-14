# Assignment-DBI-
Để tin học hóa việc quản lý bệnh án của các bệnh nhân tại một bệnh viện quốc tế cần các thông tin quản lý sau:
-Một bệnh nhân lần đầu tiên khám bệnh tại bệnh viện được phát phiếu đăng ký khám bệnh và theo dõi sức khỏe thường xuyên của bệnh viện. Bệnh nhân cần đóng một lệ phí hằng năm cho việc quản lý và khám định kỳ hằng năm.


-Thông tin phiếu đăng ký bao gồm: Họ tên, điạ chỉ, ngày sinh, điện thoại liên lạc. Nhờ thông tin của phiếu đăng ký này và lệ phí đóng một năm, bệnh nhân được phát hồ sơ bệnh án. Thông tin hồ sơ bệnh án bao gồm: Trang bìa ghi Mã hồ sơ để phân biệt các bệnh nhân khác nhau, và các thông tin từ phiếu đăng ký. Các trang sau ghi nhận phiếu khám bệnh, thông tin ghi nhận bao gồm: Ngày giờ khám, bác sĩ khám, khoa điều trị, triệu chứng (Nhức đầu, thân nhiệt, huyết áp v.v...), toa thuốc điều trị cho triệu chứng trên và các xét nghiệm cần thiết. Tất cả thông tin trên được phòng chăm sóc và theo dõi khách hàng ghi nhận lại trên máy vi tính sau khi bệnh nhận làm thủ tục xuất viện và thanh toán viện phí. Thông tin này tiện cho việc theo dõi diễn biến của bệnh, phản ứng phụ do thuốc gây ra cũng như hiệu quả của việc điều trị và trách nhiệm của bác sĩ trong các đợt điều trị.


-Mỗi khi bệnh nhân khám bệnh lần sau có thể mang hồ sơ bệnh án theo hoặc chỉ cần báo mã hồ sơ (hoặc các thông tin tìm kiếm khác để lấy ra hồ sơ trong máy vi tính). Các bác sĩ điều trị lần này có thể biết được lý lịch bệnh án và sức khỏe của bệnh nhân để đưa ra cách điều trị thích hợp nhất.


-Các bệnh nhân có hồ sơ bệnh án ngoài việc điều trị bệnh còn có quyền lợi khám sức khỏe định kỳ theo quý mà không phải đóng tiền. Bệnh nhân có thể gọi đến phòng chăm sóc khách hàng để có cuộc hẹn chính xác ngày giờ khám phù hợp với thời gian rãnh rỗi của khách hàng. Thông tin các đợt khám sức khoẻ cũng được ghi nhận như một lần điều trị nhưng không có bệnh hoặc phát hiện mầm bệnh sớm nhất để phục vụ khách hàng hiệu quả nhất.





Các thực thể chính (Entities):
Hồ sơ bệnh án : Lưu trữ thông tin của bệnh nhân.
Thuộc tính: ID hồ sơ , họ tên, địa chỉ, ngày sinh, điện thoại liên lạc, ngày lập hồ sơ, ngày hết hạn hồ sơ 
Phiếu đăng ký khám bệnh: Thông tin đăng ký khám ban đầu của bệnh nhân.
Thuộc tính: ID phiếu đăng ký
Lệ phí : Quản lý thông tin lệ phí  của bệnh nhân.
Thuộc tính: ID hóa đơn lệ phí, ngày đóng lệ phí, Số tiền lệ phí.
Phiếu nhập xuất viện : Lưu trữ thông tin xuất viện của bệnh nhân
Thuộc tính: ID phiếu nhập xuất viện, ngày nhập viện, ngày xuất viện
Viện phí: Quản lý thông tin về viện phí của bệnh nhân
Thuộc tính: ID hóa đơn viện phí, Ngày đóng viện phí, số tiền viện phí
Bác sĩ : Lưu thông tin về các bác sĩ 
Thuộc tính: ID bác sĩ, họ và tên bác sĩ, địa chỉ bác sĩ, số điện thoại bác sĩ
Phiếu khám bệnh : Lưu trữ thông tin về lịch khám bệnh của bệnh nhân.
Thuộc tính: Mã phiếu khám bệnh, ngày giờ khám.
Phiếu xét nghiệm: Lưu trữ thông tin về kết quả xét nghiệm của bệnh nhân.
Thuộc tính: ID phiếu xét nghiệm, tên xét nghiệm, ngày xét nghiệm, kết quả xét nghiệm.
Chi tiết phiếu khám bệnh : Lưu trữ thông tin chi tiết về bệnh của bệnh nhân.
Thuộc tính: Mã phjếu khám bệnh, triệu chứng.
Toa thuốc  : Lưu trữ thông tin về toa thuốc của bệnh nhân.
Thuộc tính: ID thuốc, tên thuốc, hướng dẫn sử dụng.
Khoa : Lưu trữ thông tin về khoa của các bác sĩ .
Thuộc tính: Mã khoa, tên khoa .
Bệnh : Lưu trữ thông tin về bệnh của bệnh nhân.
Thuộc tính: Mã bệnh, tên bệnh .

Chi tiết toa thuốc  : Lưu trữ thông tin chi tiết về toa thuốc của bệnh nhân.
Thuộc tính: Mã toa thuốc, số lượng .












