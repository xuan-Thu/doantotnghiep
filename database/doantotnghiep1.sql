-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 09, 2022 lúc 05:01 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `doantotnghiep`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum is', 'lorem-ipsum-is', '/storage/photos/1/Banner/banner-01.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'inactive', '2022-07-05 01:47:38', '2022-07-05 20:00:41'),
(2, 'Lorem Ipsum', 'lorem-ipsum', '/storage/photos/1/Banner/banner-07.jpg', '<p>Up to 90%</p>', 'inactive', '2022-07-05 01:50:23', '2022-07-05 20:00:46'),
(3, 'Banner', 'banner', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'inactive', '2022-07-05 20:46:59', '2022-07-05 20:00:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', 'percent', '10.00', 'active', NULL, NULL),
(3, 'abcd', 'fixed', '250.00', 'active', '2022-07-05 20:54:58', '2022-07-05 20:54:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2022-07-05_000000_create_users_table', 1),
(2, '2022-07-05_000001_create_password_resets_table', 1),
(3, '2022-07-05_000002_create_failed_jobs_table', 1),
(4, '2022-07-05_000003_create_brands_table', 1),
(5, '2022-07-05_000004_create_banners_table', 1),
(6, '2022-07-05_000005_create_categories_table', 1),
(7, '2022-07-05_000006_create_products_table', 1),
(8, '2022-07-05_000007_create_post_categories_table', 1),
(9, '2022-07-05_000008_create_post_tags_table', 1),
(10, '2022-07-05_000009_create_posts_table', 1),
(11, '2022-07-05_000010_create_messages_table', 1),
(12, '2022-07-05_000011_create_shippings_table', 1),
(13, '2022-07-05_000012_create_orders_table', 1),
(14, '2022-07-05_000013_create_carts_table', 1),
(15, '2022-07-05_000014_create_notifications_table', 1),
(16, '2022-07-05_000015_create_coupons_table', 1),
(17, '2022-07-05_000016_create_wishlists_table', 1),
(18, '2022-07-05_000017_create_product_reviews_table', 1),
(19, '2022-07-05_000018_create_post_comments_table', 1),
(20, '2022-07-05_000019_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('xuanthu13090@gmail.com', '$2y$10$yWxfYmb1ZG7HNWxZX5Dr1enZdG07QY6G9J0nBI1hdAQ6cKD7xR30u', '2022-07-05 02:52:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DORAEMON CÔNG BỐ MOVIE CHO NĂM 2023, CỐT TRUYỆN HOÀN TOÀN MỚI!', 'doraemon-cong-bo-movie-cho-nam-2023-cot-truyen-hoan-toan-moi', '<p><span style=\"font-weight: 700;\">Mới đây, sau khoảng thời gian dài chờ đợi thì bộ phim điện ảnh thứ 42 của sê-ri điện ảnh Doraemon đã chính thức được công bố sau \"Doraemon: Nobita Và Cuộc Chiến Vũ Trụ Tí Hon 2021\" vào năm nay. Trang web chính thức cho sê-ri cũng đã công bố trailer và visual đầu tiên cho dự án.</span></p>', '<p>Theo công bố chính thức, bộ phim điện ảnh thứ 42 của Doraemon sẽ có tựa đề là Eiga Doraemon: Nobita To Sora No Utopia - Doraemon The Movie 2023: Nobita and Utopia in the Sky (Tạm dịch: Doraemon - Nobita Và Utopia Trên Bầu Trời)</p><p>Mặc dù chi tiết về câu chuyện vẫn chưa được tiết lộ nhưng khi xem qua trailer thì đây sẽ là một bộ phim về hành trình của nhóm bạn Nobita với cuộc phiêu lưu ở \"Utopia\", một thế giới hoàn hảo trên bầu trời, nơi mà mọi người có thể sống hạnh phúc.</p><p><br></p><div id=\"ta-179344\" class=\"player note-video-clip\" style=\"position: relative; margin: 0px auto; padding: 0px; background: rgb(0, 0, 0); overflow: hidden; outline: none; width: 660px; height: 371px;\"><iframe src=\"https://tinanime.com/embed/179344\" style=\"outline: none; border-width: initial; border-style: none; position: relative; margin: 0px auto; padding: 0px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: hidden; width: 660px; height: 371px;\"></iframe></div><p><br></p><p>Takumi Doyama, người đã thực hiện nhiều tập ngắn cho bộ anime truyền hình Doraemon và đây là lần đầu tiên mà người này tham gia vào vai trò đạo diễn cho phim điện ảnh Doraemon. Trong khi đó, Ryota Kosawa sẽ đảm nhận phần kịch bản.</p><p>Kosawa có chia sẻ:</p><p style=\"margin-left: 25px;\"><i>Doraemon là một kho báu tuyệt vời do một thiên tài phi thường đã để lại và tôi rất vinh dự để được ngồi vào chiếc ghế mà nhiều nhà sáng tạo mong muốn, những người đã giữ nó tồn tại cho đến ngày hôm nay. Tôi quyết định tiếp tục một cuộc phiêu và làm việc chăm chỉ cho trẻ em ngày hôm nay. Tôi hy vọng các bạn sẽ cùng Doraemon, Nobita và những người khác tham gia vào cuộc phiêu lưu mới trên bầu trời.</i></p><p><br></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/06/f0a550645ac18d1a_cc4abd2633ba7665_10127116570783722185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"><br></p><p>Bộ phim điện ảnh thứ 41 trước đó, \"Nobita Và Cuộc Chiến Vũ Trụ Tí Hon 2021\" đã được khởi chiếu vào năm nay sau hơn một năm phải trì hoãn vì đại dịch Covid-19. Theo Box Office Mojo, bộ phim đã thu về 22 triệu USD (hơn 500 tỷ đồng). Tại Việt Nam, bộ phim đã thu về kỷ lục 50 tỷ đồng.</p><p><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"></p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/4e6e6ec7dbce4b32_4f751e364d03f8ca_4040616570778216185710.jpg', 'Anime', 1, NULL, 1, 'active', '2022-07-08 19:40:39', '2022-07-08 19:40:39'),
(2, 'KAGUYA-SAMA: CUỘC CHIẾN TỎ TÌNH SẼ CHIA TAY KHÁN GIẢ VÀO THÁNG 10 NÀY!', 'kaguya-sama-cuoc-chien-to-tinh-se-chia-tay-khan-gia-vao-thang-10-nay', '<p><span style=\"font-weight: 700; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Vào hôm thứ năm vừa qua, trong số thứ 31 năm nay của tạp chí Young Jump do nhà xuất bản Shueisha phát hành đã xác nhận bộ manga Kaguya-sama wa Kokurasetai ~Tensai-tachi no Ren\'ai Zunōsen~ (Quý Cô Kaguya Và Cuộc Chiến Tỏ Tình ~Khi Thiên Tài Thả Thính~) của tác giả Aka Akasaka sẽ kết thúc trong 14 chương nữa. Nếu như không có sự trì hoãn, manga sẽ kết thúc vào tháng 10 năm nay.</span><br></p>', '<p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Bộ manga đã bước vào arc cuối cùng từ tháng 10 năm ngoái.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; margin-left: 25px;\"><i>Ở trong Hội học sinh của khối cao trung thuộc Học viện Shūchiin, Hội trưởng Shirogane Miyuki và Phó hội trưởng Shinomiya Kaguya vẻ ngoài như một cặp đôi hoàn hảo. Kaguya là con gái của gia tộc tài phiệt giàu có, và Miyuki là học sinh nổi tiếng khi luôn đứng đầu thành tích học tập trong trường. Mặc dù họ thích nhau, nhưng họ quá tự cao khi thổ lộ tình cảm của mình vì họ đều nghĩ rằng ai tỏ tình trước sẽ thua. Câu chuyện kể về các kế hoạch của họ để khiến người khác thú nhận mình thích người kia.</i></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><br></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><img src=\"https://s199.imacdn.com/ta/2022/06/30/d7c29ca8947222cc_59084d11d101d86a_5428716565623045185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><br></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Kaguya-sama wa Kokurasetai ~Tensai-tachi no Ren\'ai Zunōsen~ là một sê-ri manga seinen Nhật Bản được viết và minh hoạ bởi Akasaka Aka. Bộ truyện được xuất bản bằng tiếng Anh bởi Viz Media và được mua bản quyền phát hành tiếng Việt bởi Nhà xuất bản Kim Đồng. Hai manga spin off đã được ra mắt vào năm 2018. Series anime được A-1 Pictures sản xuất và lên sóng truyền hình từ năm 2019.</p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><br></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Anime:&nbsp;<a href=\"https://vuighe.net/kaguya-sama-wa-kokurasetai-tensai-tachi-no-renai-zunousen\" target=\"_blank\" style=\"color: rgb(255, 77, 0);\">https://vuighe.net/kaguya-sama-wa-kokurasetai-tensai-tachi-no-renai-zunousen</a></p><p style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Manga:&nbsp;<a href=\"https://truyentranh24z.com/kaguya-sama-wa-kokurasetai-tensai-tachi-no-renai-zunousen\" target=\"_blank\" style=\"color: rgb(255, 77, 0);\">https://truyentranh24z.com/kaguya-sama-wa-kokurasetai-tensai-tachi-no-renai-zunousen</a></p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/c9e9913114007de1_bbf99550e6e84e2d_11135016565622533185710.jpg', 'Anime', 4, NULL, 1, 'active', '2022-07-08 19:34:51', '2022-07-08 19:34:51'),
(3, 'THÔNG TIN ĐẰNG SAU CÂU CHUYỆN \"ONE PIECE SẼ KẾT THÚC SỚM 10 NĂM\"!', 'thong-tin-dang-sau-cau-chuyen-one-piece-se-ket-thuc-som-10-nam', '<p><span style=\"font-weight: 700;\">One Piece đã được biết đến là bộ manga bán chạy nhất trên toàn thế giới và một điều thú vị trong bộ truyện chính là cách xây dựng thế giới và tính cách các nhân vật một cách đa chiều trong vũ trụ của hải tặc mà không nhàm chán. Tất cả những điều này đã được thực hiện một cách chậm rãi trong manga sau 25 năm (1997-2022).</span></p><p><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"></p>', '<p>Mặt khác, độ dài của bộ truyện cũng là một trong những khía cạnh hấp dẫn đối với One Piece khi thông tin của mọi nhân vật đều được giải thích cặn kẽ khiến người xem hiểu hơn về tính cách cũng như nội tâm của từng nhân vật. Tuy nhiên, đây cũng chính là điều tiêu cực mà bộ truyện mang lại khi không phải ai cũng \"dư thời gian\" để xem hết hơn 1000 tập anime hay là đọc chi tiết hơn 1000 chương truyện.&nbsp;</p><p><br></p><p><img src=\"https://s199.imacdn.com/ta/2022/06/28/9a3fa66fb3a8f1ac_2d94f5e39111a167_19681816564313767185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p><br></p><p>Trong một cuộc phỏng vấn được một fan hâm mộ One Piece lâu năm và đáng tin cậy chia sẻ trên Twitter vào năm 2012 thì Eiichiro Oda đã có ý định kết thúc bộ truyện sớm hơn 10 năm. Tác giả đã chia sẻ rằng cảm thấy chán nản và buồn khi vẽ One Piece vì đây chính là thứ đã chia cắt tác giả với con gái của mình. Oda chia sẻ cô bé đã nói với ông: \"Bố quá bận để dành thời gian cho con\".&nbsp;</p><p><br></p><p><img src=\"https://s199.imacdn.com/ta/2022/06/28/c32b803d88b2f188_419d39cde815be7f_2924016564314344185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><div style=\"margin-top: 10px; text-align: center;\"><i>Hình ảnh Oda và vợ.</i></div><p></p><p><br></p><p>Oda cũng đã cân nhắc việc nghỉ hưu nhưng may mắn thay, con gái của tác giả đã giải cứu cho một chú chó Chihuahua và sau đó cả hai đã trở thành bạn. Do con gái mình có một người bạn mới nên Oda cũng đã bắt đầu có thời gian để quay trở lại với One Piece.</p><p>Có thể nói, nhờ người bạn Chihuahua mà chúng ta đã biết đến những nhân vật như Yamato hay Đô đốc Lục Ngưu vì có thể nếu kết thúc sớm 10 năm thì những chi tiết này có lẽ đã không thể xuất hiện.</p><p><br></p><p><img src=\"https://s199.imacdn.com/ta/2022/06/28/f3203a229506d390_3d4ecd6d8b32d801_8627416564316492185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p><br></p><p>Hiện tại, tác giả của One Piece cũng đã tạm dừng vẽ manga để chuẩn bị cho \"câu chuyện cuối cùng\". Đồng thời, TinAnime cũng xin khẳng định lại với tất cả các độc giả là \"CÂU CHUYỆN CUỐI CÙNG\" thay vì \"ARC CUỐI CÙNG\" như những thông tin lan truyền trên mạng xã hội gây ra sự nhầm lẫn đối với mọi người. Việc \"CÂU CHUYỆN CUỐI CÙNG\" diễn ra vẫn có thể xuất hiện hàng chục arc lớn bé chứ không phải mang nghĩa chỉ còn một arc.</p><p><br></p><p>Anime:&nbsp;<a href=\"https://mephimnhat.com/one-piece\" target=\"_blank\" style=\"color: rgb(255, 77, 0);\">https://mephimnhat.com/one-piece</a>&nbsp;</p><p>Manga:&nbsp;<a href=\"https://truyentranh24z.com/one-piece\" target=\"_blank\" style=\"color: rgb(255, 77, 0);\">https://truyentranh24z.com/one-piece</a>&nbsp;</p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/9f4de29c673b37e4_18848b89e54ddeb8_9732216564311842185710.jpg', 'Anime', 4, NULL, 1, 'active', '2022-07-08 19:39:02', '2022-07-08 19:39:02'),
(4, 'LỊCH PHÁT SÓNG ANIME MÙA HÈ 2022 THEO GIỜ VIỆT NAM! LƯU LẠI NGAY!', 'lich-phat-song-anime-mua-he-2022-theo-gio-viet-nam-luu-lai-ngay', '<p><span style=\"font-weight: 700; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\">Nhằm để thuận tiện hơn cho người hâm mộ theo dõi các bộ anime thì TinAnime đã tổng hợp lại và đưa ra thời gian chuẩn giữa Nhật Bản và Việt Nam. Bây giờ thì các bạn còn chần chờ gì nữa mà không lưu lại bài viết này để chuẩn bị cho một mùa Hè 2022 với nhiều bộ anime hấp dẫn đúng không nào?</span><br></p>', '<p><span style=\"font-weight: 700;\">Thứ sáu, ngày 1 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/04/ea57cd21cdbc9092_5b74db01499c6b74_16023116569538768185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">D4DJ Double Mix:&nbsp;</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 09:00&nbsp;<br>&nbsp; &nbsp; Giờ Việt Nam - 07:00<br></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Kanojo, Okarishimasu 2nd Season:</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:25 (ngày 2 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:25<br></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Kami Kuzu☆Idol:</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:53 (ngày 2 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:53<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ bảy, ngày 2 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/2d76a2b744c1b73f_89787ea01ea43243_9873416569541749185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">iii icecrin 2:</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 07:00<br>&nbsp; &nbsp; Giờ Việt Nam - 05:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Teppen!!!!!!!!!!!!!!!</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:00<br>&nbsp; &nbsp; Giờ Việt Nam - 20:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Lycoris Recoil</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30&nbsp;<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Musashino!&nbsp;</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Shoot! Goal to the Future</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30&nbsp;</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Engage Kiss</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:30 (ngày 3 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:30&nbsp;</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Utawarerumono Mask of Truth</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:00 (ngày 3 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:00&nbsp;<br></p><p style=\"margin-left: 25px;\"><br></p><p><span style=\"font-weight: 700;\">Chủ nhật, ngày 3 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/d4889df9555a2a92_3811af28f73798ba_11980516569542938185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Renmei Kuugun Koukuu Mahou Ongakutai Luminous Witches</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:00&nbsp;<br>&nbsp; &nbsp; Giờ Việt Nam - 19:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">RWBY: Hyosetsu Teikoku</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:30<br>&nbsp; &nbsp; Giờ Việt Nam - 20:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">YUREI DECO</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:00<br>&nbsp; &nbsp; Giờ Việt Nam - 21:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Prima Doll</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ hai, ngày 4 tháng 7&nbsp;</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/1d7dc5bfea92653f_950c758048d15a14_10886716569544037185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Tensei Kenja no Isekai Life ~Dai-2 no Shokugyou wo Ete, Sekai Saikyou ni Narimashita~</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 20:00<br>&nbsp; &nbsp; Giờ Việt Nam - 18:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Youkoso Jitsuryoku Shijou Shugi no Kyoushitsu e 2nd Season</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:00<br>&nbsp; &nbsp; Giờ Việt Nam - 19:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">CARDFIGHT!! VANGUARD will+Dress</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 5 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ ba, ngày 5 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/4055b98dee7680d4_565d1bc4e71d0dcf_15809916569545151185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Overlord IV</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:00<br>&nbsp; &nbsp; Giờ Việt Nam - 20:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Kinsou no Vermeil ~Gakeppuchi Majutsushi wa Saikyou no Yakusai to Mahou Sekai wo Tsukisusumu~</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:30<br>&nbsp; &nbsp; Giờ Việt Nam - 20:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Tokyo Mew Mew New~♡</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 6 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00</p><p style=\"margin-left: 25px;\"><br></p><p><span style=\"font-weight: 700;\">Thứ tư, ngày 6 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/08909aa14dffd2ff_7301a995af451afa_11995716569546435185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Jashin-chan Dropkick X</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 02:05<br>&nbsp; &nbsp; Giờ Việt Nam - 00:05</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Mamahaha no Tsurego ga Motokano datta</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:00<br>&nbsp; &nbsp; Giờ Việt Nam - 19:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Warau Arsnotoria Sun—!</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:30<br>&nbsp; &nbsp; Giờ Việt Nam - 19:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Isekai Ojisan</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:00<br>&nbsp; &nbsp; Giờ Việt Nam - 20:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">MADE IN ABYSS: Retsujitsu no Ougonkyo</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:30<br>&nbsp; &nbsp; Giờ Việt Nam - 20:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Isekai Meikyuu de Harem wo</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Shin Tennis no Ouji-sama: U-17 WORLD CUP</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 7 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ năm, ngày 7 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/fee8ad37aaa53a8a_2ff212e3c4e09ff5_7969916569547612185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Kumichou Musume to Sewagakari</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:30<br>&nbsp; &nbsp; Giờ Việt Nam - 20:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Yofukashi no Uta</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:55 (ngày 8 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:55</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">CHIMIMO</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:30 (ngày 8 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Soredemo Ayumu wa Yosetekuru</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:35 (ngày 8 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:35&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ sáu, ngày 8 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/ab083a993adcbbe3_e3f900b0e67e3f4f_9754216569548406185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Bucchigire!</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:30&nbsp;<br>&nbsp; &nbsp; Giờ Việt Nam - 20:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">SHADOWS HOUSE 2nd Season</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 9 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Hoshi no Samidare</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:55 (ngày 9 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:55&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ bảy, ngày 9 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/acaa9cabd4da9912_d41833ada62350e3_16022516569549118185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Kuro no Shoukanshi</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 22:00<br>&nbsp; &nbsp; Giờ Việt Nam - 20:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Extreme Hearts</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:30 (ngày 10 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:30&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Chủ nhật, ngày 10 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/d8ecd421a5c21a50_e7d298164769cbbc_9271116569550167185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Dr. STONE: Ryusui</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 19:00&nbsp;<br>&nbsp; &nbsp; Giờ Việt Nam - 17:00</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Isekai Yakkyoku</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:30<br>&nbsp; &nbsp; Giờ Việt Nam - 19:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Hanabi-chan wa Okuregachi</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 21:55<br>&nbsp; &nbsp; Giờ Việt Nam - 19:55</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">KJ File</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 11 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ hai, ngày 11 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/47a8a5de8e089c35_b82c0e274da96799_7921816570309031185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">ORIENT 2nd Cour</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:30 (ngày 12 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:30</p><p><br></p><p><span style=\"font-weight: 700;\">Thứ ba, ngày 12 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/b679f4b71663dc98_e46dfb7f5e23bb0f_17440016570309592185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">SHINEPOST</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:29 (ngày 13 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:29</p><p><br></p><p><span style=\"font-weight: 700;\">Thứ năm, ngày 14 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/fd97ec05403ff46e_86d6802da79db6a9_14944616570310487185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Hataraku Maou-sama!!</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:30<br>&nbsp; &nbsp; Giờ Việt Nam - 21:30</p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">5-Okunen Button ~Sota Sugahara no Short Short~</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:30 (ngày 15 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:30&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Chủ nhật, ngày 17 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/3144d6a9cc3ed955_1c911facfa9bf7ab_12600716570311028185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Love Live! Superstar!! 2nd Season</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 19:00<br>&nbsp; &nbsp; Giờ Việt Nam - 17:00<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ năm, ngày 21 tháng 7</span></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/05/1e34259092e568df_132449499c0a30a2_8429816570311653185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Dungeon ni Deai wo Motomeru no wa Machigatteiru no Darou ka IV&nbsp;</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:00<br>&nbsp; &nbsp; Giờ Việt Nam - 21:00&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Chủ nhật, ngày 24 tháng 7</span></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Saikin Yatotta Maid ga Ayashii</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 02:00<br>&nbsp; &nbsp; Giờ Việt Nam - 00:00&nbsp;<br></p><p><span style=\"font-weight: 700;\"><br></span></p><p><span style=\"font-weight: 700;\">Thứ năm, ngày 28 tháng 7</span></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">BanG Dream! Morfonication</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 23:00<br>&nbsp; &nbsp; Giờ Việt Nam - 21:00&nbsp;<br class=\"Apple-interchange-newline\"></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ bảy, ngày 30 tháng 7</span></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Uta no☆Prince-sama♪ Maji Love ST☆RISH Tours ~Tabi no Hajimari~</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 31 tháng 7)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Chủ nhật, ngày 31 tháng 7</span></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Fuuto Tantei</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 00:00 (ngày 1 tháng 8)<br>&nbsp; &nbsp; Giờ Việt Nam - 22:00&nbsp;<br></p><p><br></p><p><span style=\"font-weight: 700;\">Thứ tư, ngày 3 tháng 8</span></p><p style=\"margin-left: 25px;\"><span style=\"font-weight: 700;\">Yoru wa Neko to Issho</span><br>&nbsp; &nbsp; Giờ Nhật Bản - 01:00 (ngày 4 tháng 8)<br>&nbsp; &nbsp; Giờ Việt Nam - 23:00<br></p><p><br></p><p>Bạn đã sẵn sàng cho loạt bom tấn sẽ đổ bộ hay chưa?</p><p><br style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"></p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/ea57cd21cdbc9092_5b74db01499c6b74_16023116569538768185710.jpg', 'Anime', 1, NULL, 1, 'active', '2022-07-08 19:42:26', '2022-07-08 19:42:26'),
(5, 'FACEBOOK CẬP NHẬT CẢNH BÁO NGƯỜI DÙNG KHI TÌM KIẾM TỪ KHÓA \"LOLI\"!', 'facebook-cap-nhat-canh-bao-nguoi-dung-khi-tim-kiem-tu-khoa-loli', '<p><span style=\"font-weight: 700;\">Hẳn nhiều bạn đã biết đến khái niệm loli và đây cũng là từ được sử dụng nhiều bởi người hâm mộ anime. Nghĩa của từ này đề cập đến những cô gái trẻ chưa kết thúc tuổi dậy thì và thường nhỏ hơn 17 tuổi. Gần đây, Facebook đã bổ sung thêm tính năng mới là cảnh báo người dùng khi cố gắng tìm kiếm từ khóa \"loli\" trên nền tảng của mình.</span></p>', '<p>Khi bạn sử dụng thanh tìm kiếm Facebook để tìm kiếm từ khóa \"loli\" thì ngay lập tức, Facebook đã đưa ra cảnh báo về việc cụm từ này có liên quan đến lạm dụng tình dục trẻ em và việc lạm dụng này là hành vi vi phạm pháp luật.</p><p><br></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/04/fa54b9d953e50934_32b22e10855fcfe0_11835716569331244185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"></p><p><img src=\"https://s199.imacdn.com/ta/2022/07/04/6cbe78a580471a02_062b375fd39cef4c_5643216569331585185710.jpg\" data-filename=\"filename\" style=\"border: 0px; display: block; margin: auto; max-width: 100%; padding: 10px 0px 0px;\"><br></p><p>Sau đó, Facebook đã cho người dùng hai sự lựa chọn là \"Xem cách báo cáo\" nhằm để báo cáo những hình ảnh/hành vi vi phạm pháp luật về lạm dụng tình dục trẻ em hoặc \"Nhận sự trợ giúp và hỗ trợ\".&nbsp;</p><p>Bạn nghĩ sao về động thái này của Facebook?</p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/3e9257f91771f3d9_f7b42d9520bc3496_6159616569330309185710.jpg', '', 1, NULL, 1, 'active', '2022-07-08 19:50:39', '2022-07-08 19:50:39'),
(6, 'Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact !!!', 'ra-mat-trong-thang-7-bom-tan-the-gioi-mo-moi-nhat-sap-trinh-lang-de-doa-vi-tri-cua-genshin-impact', '<p><div id=\"admzonek9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; color: rgb(51, 51, 51); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><div id=\"zone-k9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"share-k9yy7w7v\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"placement-khju1mi0\" revenue=\"cpm\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"banner-k9yy7w7l-khju1mib\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; min-height: 0px; min-width: 0px;\"><div id=\"slot-1-k9yy7w7l-khju1mib\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"ssppagebid_8368\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"></div></div></div></div></div></div></div></p><h2 data-field=\"sapo\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 15px; outline: none; color: rgb(82, 80, 80); font-weight: bold; font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">Không ít game thủ Genshin Impact cũng đang dành rất nhiều sự quan tâm cho bom tấn thế giới mở này.</h2>', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Chứng kiến thành công của Genshin Impact và cả Elden Ring trong thời gian gần đây, chắc hẳn không ít người cũng đã dần nhận ra xu thế của làng game&nbsp;hiện tại đang là thời điểm phát triển cực thịnh của những tựa game thế giới mở. Bản thân Tencent&nbsp;- ông lớn số một của ngành game thế giới cũng nhận ra điều này.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">V<span style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\">à đó cũng là lý do mà sắp tới đây, hay cụ thể là ngay trong tháng 7 này, Noah\'s Heart - một bom tấn thế giới mở sẽ ra mắt, thậm chí hứa hẹn sẽ trở thành đối thủ xứng tầm với Genshin Impact.</span></p><div class=\"VCSortableInPreviewMode\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570799081061175798721.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Genshin Impact tuy đang là tựa game thế giới mở top đầu ở thời điểm hiện tại\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/6/photo-1-16570799081061175798721.jpg\" id=\"img_468989926768082944\" w=\"728\" h=\"409\" alt=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 1.\" title=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 1.\" rel=\"lightbox\" photoid=\"468989926768082944\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570799081061175798721.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Genshin Impact tuy đang là tựa game thế giới mở top đầu ở thời điểm hiện tại, nhưng cần phải dè chừng với bom tấn mới mang tên Noah\'s Heart</p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Dành cho những ai chưa biết thì Noah’s Heart là một tựa game MMORPG thế giới mở được phát triển bởi Zulong Entertainment và lấy bối cảnh trên chình hành tinh Noha - như tên của trò chơi vậy. Được đầu tư kỹ lưỡng cả về mặt hình ảnh, nội dung cũng như gameplay, thế nên, không ít người kỳ vọng bom tấn này sẽ cạnh tranh sòng phẳng, thậm chí còn đe dọa cả vị trí thống trị của Genshin Impact trong thể loại này.</p><div class=\"VCSortableInPreviewMode\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570819506391481640452.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Noah’s Heart sẽ ra mắt trong tháng này\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/6/photo-1-16570819506391481640452.jpg\" id=\"img_468998496016732160\" w=\"1000\" h=\"523\" alt=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 3.\" title=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 3.\" rel=\"lightbox\" photoid=\"468998496016732160\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570819506391481640452.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Noah’s Heart sẽ ra mắt trong tháng này</p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Mặc dù dự kiến ra mắt vào tháng 4 năm nay, nhưng vì nhiều lý do mà tới mới đây thôi, Noah’s Heart mới đưa ra thông báo mới nhất về việc sẽ phát hành toàn cầu vào 28/7 tới đây. Tại một số quốc gia châu Âu, tựa game này thậm chí còn ra mắt sớm hơn 2 tuần trên hai nền tảng chính là Android và iOS.</p><div class=\"VCSortableInPreviewMode\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570845988381715911542.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Bom tấn thế giới mở công bố lộ trình ra mắt trong tháng 7 này\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/6/photo-1-16570845988381715911542.jpg\" id=\"img_469009607641726976\" w=\"1152\" h=\"648\" alt=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 4.\" title=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 4.\" rel=\"lightbox\" photoid=\"469009607641726976\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570845988381715911542.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Bom tấn thế giới mở công bố lộ trình ra mắt trong tháng 7 này</p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Bên cạnh việc háo hức chờ đợi màn ra mắt của Noah’s Heart, cũng có không ít ý kiến bày tỏ sự quan ngại, thậm chí tự hỏi rằng bom tấn này có thể cạnh tranh nổi với Genshin Impact hay không. Xét về nền đồ họa, với việc được phát triển trên Engine Unreal 4, tuy không phải mới nhất ở thời điểm hiện tại nhưng ít nhất, Noah’s Heart cũng ở mức \"xem được\" trong mắt các game thủ.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Chỉ có điều, cốt truyện của trò chơi này bị đánh giá là không thể so được với Genshin Impact và đây cũng là ý kiến chung của nhiều game thủ đã chơi qua máy chủ thử nghiệm.</p><div class=\"VCSortableInPreviewMode\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-1657084397853729745116.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Đồ họa khá đẹp của Noah’s Heart\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/6/photo-1-1657084397853729745116.jpg\" id=\"img_469008776719126528\" w=\"2000\" h=\"1124\" alt=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 5.\" title=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 5.\" rel=\"lightbox\" photoid=\"469008776719126528\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-1657084397853729745116.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Đồ họa khá đẹp của Noah’s Heart</p></div></div><div class=\"VCSortableInPreviewMode active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570844064301085711896.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Tuy nhiên, tựa game này vẫn còn nhiều yếu kém trong khâu xây dựng cốt truyện\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/6/photo-1-16570844064301085711896.jpg\" id=\"img_469008795147833344\" w=\"1200\" h=\"675\" alt=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 6.\" title=\"Ra mắt trong tháng 7, bom tấn thế giới mở mới nhất sắp trình làng, đe dọa vị trí của Genshin Impact - Ảnh 6.\" rel=\"lightbox\" photoid=\"469008795147833344\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/6/photo-1-16570844064301085711896.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Tuy nhiên, tựa game này vẫn còn nhiều yếu kém trong khâu xây dựng cốt truyện</p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tuy nhiên, Noah’s Heart ngay từ đầu đã được định hình là sẽ tập trung vào các hoạt động cũng như hệ thống chiến đấu. Trong game, người sẽ được lựa chọn 4 nhân vật với các kỹ năng và vũ khí khác nhau bao gồm Thương, Cung Tên, Song Đao, Kiếm cùng Khiên mang tới những sức mạnh, hiệu ứng riêng biệt.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Và nếu như để tìm một điều khiến nhiều game thủ vẫn còn cân nhắc trong việc tải về siêu phẩm này thì có lẽ không gì khác ngoài yêu cầu cấu hình cao cũng như dung lượng khá nặng của trò chơi này.</p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/6570799480742098489840.jpg', 'Game', 2, NULL, 1, 'active', '2022-07-08 19:56:27', '2022-07-08 19:56:27');
INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, '10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1)', '10-tua-game-duoc-mong-cho-nhat-trong-nam-2023-toan-cac-sieu-pham-bom-tan-an-minh-it-nguoi-biet-p1', '<p><div id=\"admzonek9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; color: rgb(51, 51, 51); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><div id=\"zone-k9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"share-k9yy7w7v\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"placement-k9yy9tyy\" revenue=\"cpm\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"banner-k9yy7w7l-k9yy9tzc\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; min-height: 0px; min-width: 0px;\"><div id=\"slot-1-k9yy7w7l-k9yy9tzc\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"ssppagebid_5985\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"></div></div></div></div></div></div></div></p><h2 data-field=\"sapo\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 15px; outline: none; color: rgb(82, 80, 80); font-weight: bold; font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">Đa số các tựa game đều đã lên lịch ra mắt vào năm 2023.</h2>', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Mặc dù chỉ năm 2022 mới chỉ trôi qua được một nửa, thế nhưng ở thời điểm hiện tại, làng game thế giới đã dược chứng kiến không ít những siêu phẩm. Nổi bật trong đó chắc chắn phải kể tới&nbsp;<a class=\"seo-suggest-link\" href=\"https://gamek.vn/elden-ring.htm\" target=\"_blank\" title=\"elden ring\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\">Elden Ring</a>&nbsp;của FromSoftware và Pokemon Legends: Arceus của Nintendo - hai bom tấn vừa sở hữu điểm số cực cao từ phía các chuyên gia, vừa phá vỡ kỷ lục doanh thu và tạo nên những thành tích vô tiền khoáng hậu.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tuy nhiên, cũng vì sự thành công ngoài sức mong đợi ấy mà không ít NPH đã lựa chọn lùi thời điểm ra mắt các tựa game của mình sang năm 2023, một phần để có thêm thời gian phát triển, và phần khác, để tránh gặp phải việc bị so sánh với hai siêu phẩm trên.</p><div class=\"VCSortableInPreviewMode active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569189090221824632458.jpg\" data-fancybox-group=\"img-lightbox\" title=\"Pokemon Legends: Arceus - một trong những tựa game đáng chú ý nhất của năm 2022\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/4/photo-1-16569189090221824632458.jpg\" id=\"img_468314650795016192\" w=\"1024\" h=\"576\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 1.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 1.\" rel=\"lightbox\" photoid=\"468314650795016192\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569189090221824632458.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\">Pokemon Legends: Arceus - một trong những tựa game đáng chú ý nhất của năm 2022</p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Và dưới đây chính là những tựa game đang được giới game thủ kỳ vọng nhất về sự xuất hiện của chúng trong năm 2023.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Starfield<br style=\"margin: 0px; padding: 0px; list-style: none;\"></b></p><div class=\"VCSortableInPreviewMode noCaption active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656919425908468699960.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/4/photo-1-1656919425908468699960.jpg\" id=\"img_468316814111600640\" w=\"1024\" h=\"576\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 2.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 2.\" rel=\"lightbox\" photoid=\"468316814111600640\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656919425908468699960.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Một cái tên rất bất ngờ, khi có lẽ không nhiều người từng nghe tới.&nbsp;Starfield là một tựa game hiện đang được phát triển bởi&nbsp;Bethesda và là trò chơi được tìm kiếm nhiều nhất trên Google trong những tuần giữa tháng 6 - thời điểm mà&nbsp;Starfield được giới thiệu tại một sự kiện game đình đám. Là một tựa game nhập vai với chủ đề khoa học viễn tưởng,&nbsp;Starfield được khẳng định sẽ có cốt truyện tương đối đầu tư, kéo dài khoảng 30-40 tiếng.</p><div class=\"VCSortableInPreviewMode noCaption active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656919584344161952215.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/4/photo-1-1656919584344161952215.jpg\" id=\"img_468317490885013504\" w=\"1024\" h=\"576\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 3.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 3.\" rel=\"lightbox\" photoid=\"468317490885013504\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656919584344161952215.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Ban đầu, tựa game này được lên lịch ra mắt vào năm 2022, nhưng sau đó đã chính thức lùi thời điểm lại vào 2023 để có thêm thời gian phát triển.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Hytale<br style=\"margin: 0px; padding: 0px; list-style: none;\"></b></p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569198348361300721424.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/4/photo-1-16569198348361300721424.jpg\" id=\"img_468318532544008192\" w=\"1920\" h=\"1080\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 4.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 4.\" rel=\"lightbox\" photoid=\"468318532544008192\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569198348361300721424.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tiếp tục thêm một cái tên có phần xa lạ nữa với cộng đồng mạng. Thực chất, Hytale là một dự án được phát triển bởi&nbsp;Hypixel Studios và cũng không có quá nhiều tiếng tăm. Thế nhưng, khi studio này được mua lại bởi Riot Games và tuyên bố sẽ giúp Hytale cạnh tranh sòng phẳng với Minecraft thì quả thật, trò chơi này đã dần thu hút được sự chú ý của các game thủ.</p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569198215181070130372.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/thumb_w/640/133514250583805952/2022/7/4/photo-1-16569198215181070130372.jpg\" id=\"img_468318475507789824\" w=\"1280\" h=\"720\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 5.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 5.\" rel=\"lightbox\" photoid=\"468318475507789824\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-16569198215181070130372.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Dù mới chỉ công bố dự án và tung ra một đoạn trailer ngắn ngủi, thế nhưng con số gần 60 triệu lượt xem đoạn video có lẽ cũng đủ để nói lên sức hút của trò chơi này.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Ark 2</b></p><div class=\"VCSortableInPreviewMode noCaption active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656920011809373397841.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656920011809373397841.jpg\" id=\"img_468319271523823616\" w=\"640\" h=\"360\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 6.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (P1) - Ảnh 6.\" rel=\"lightbox\" photoid=\"468319271523823616\" type=\"photo\" data-original=\"https://gamek.mediacdn.vn/133514250583805952/2022/7/4/photo-1-1656920011809373397841.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Thương hiệu Ark đã nổi tiếng xuyên suốt những năm vừa qua, và chứng tỏ mình là một trong những series thành công bậc nhất trong lịch sử. Thế nhưng, mức độ phổ biến của series này có lẽ sẽ còn nhân rộng hơn nữa, khi mà Ark 2 sẽ chính thức ra mắt vào năm 2023.</p><div class=\"VCSortableInPreviewMode noCaption active\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Không chỉ gia tăng thêm số lượng nội dung game, hệ thống quái vật của Ark 2 cũng sẽ trở nên đa dạng hơn nhiều. Và với việc tới cả siêu sao Vin Diesel cũng phải đăng Twitter để quảng cáo \"hộ\" cho Ark 2, thậm chí còn tỏ ra háo hức ngóng chờ thì không có lý do gì mà chúng ta bỏ qua siêu phẩm này được.</p><div><br></div>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/56920041909226253259.jpg', 'Game', 2, NULL, 1, 'active', '2022-07-08 19:59:01', '2022-07-08 19:59:01'),
(8, '10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2)', '10-tua-game-duoc-mong-cho-nhat-trong-nam-2023-toan-cac-sieu-pham-bom-tan-an-minh-it-nguoi-biet-p2', '<p><div id=\"admzonek9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; color: rgb(51, 51, 51); font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\"><div id=\"zone-k9yy7w7l\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"share-k9yy7w7v\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"placement-khju1mi0\" revenue=\"cpm\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"banner-k9yy7w7l-khju1mib\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none; min-height: 0px; min-width: 0px;\"><div id=\"slot-1-k9yy7w7l-khju1mib\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"><div id=\"ssppagebid_8368\" style=\"margin: 0px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 12px; outline: none;\"></div></div></div></div></div></div></div></p><h2 data-field=\"sapo\" style=\"margin: 0px 0px 20px; padding: 0px; list-style: none; text-decoration: none; border: 0px; font-size: 15px; outline: none; color: rgb(82, 80, 80); font-weight: bold; font-family: Tahoma; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px;\">Đa số các tựa game đều đã lên lịch ra mắt vào năm 2023.</h2>', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Mặc dù chỉ năm 2022 mới chỉ trôi qua được một nửa, thế nhưng ở thời điểm hiện tại, làng&nbsp;<a class=\"seo-suggest-link\" href=\"https://gamek.vn/game.htm\" target=\"_blank\" title=\"game\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; color: rgb(0, 0, 0) !important;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">game</b></a>&nbsp;thế giới đã dược chứng kiến không ít những siêu phẩm. Nổi bật trong đó chắc chắn phải kể tới&nbsp;<a class=\"seo-suggest-link\" href=\"https://gamek.vn/elden-ring.htm\" target=\"_blank\" title=\"elden ring\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; color: rgb(0, 0, 0) !important;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Elden Ring</b></a>&nbsp;của FromSoftware và Pokemon Legends: Arceus của Nintendo - hai bom tấn vừa sở hữu điểm số cực cao từ phía các chuyên gia, vừa phá vỡ kỷ lục doanh thu và tạo nên những thành tích vô tiền khoáng hậu.&nbsp;</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tuy nhiên, cũng vì sự thành công ngoài sức mong đợi ấy mà không ít NPH đã lựa chọn lùi thời điểm ra mắt các tựa game của mình sang năm 2023, một phần để có thêm thời gian phát triển, và phần khác, để tránh gặp phải việc bị so sánh với hai siêu phẩm trên.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><a class=\"seo-suggest-link\" href=\"https://gamek.vn/resident-evil.htm\" target=\"_blank\" title=\"resident evil\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; color: rgb(0, 0, 0) !important;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Resident Evil</b></a><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">&nbsp;4 Remake</b><br style=\"margin: 0px; padding: 0px; list-style: none;\"></p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921095356267648378-1657684294129-1657684294242982725786.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921095356267648378-1657684294129-1657684294242982725786.jpg\" id=\"img_468323824575516672\" w=\"640\" h=\"360\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 1.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 1.\" rel=\"lightbox\" photoid=\"468323824575516672\" type=\"photo\" data-original=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921095356267648378-1657684294129-1657684294242982725786.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\"></p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tới tận thời điểm hiện tại, Resident Evil 4 vẫn luôn là \"gà đẻ trứng vàng\" của Capcom và quả thật, NPH này cũng đã \"vắt sữa\" tựa game này một cách cùng kiệt với không ít những phiên bản từ VR, Remasterred nâng cấp đồ họa... Dẫu biết vậy, thế nhưng cái tên Resident Evil 4 vẫn luôn có sức hút và phiên bản làm lại hoàn toàn, Resident Evil 4 Remake thì lại càng thêm phần \"quyến rũ\" trong mắt game thủ khi hứa hẹn sẽ mang tới một gameplay và cốt truyện đổi mới.</p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-165692112025979531713-1657684297269-16576842973551981667192.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-165692112025979531713-1657684297269-16576842973551981667192.jpg\" id=\"img_468323922082074624\" w=\"780\" h=\"520\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 2.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 2.\" rel=\"lightbox\" photoid=\"468323922082074624\" type=\"photo\" data-original=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-165692112025979531713-1657684297269-16576842973551981667192.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\"></p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Hiện tại, Resident Evil 4 Remake đã có lịch phát hành. Cụ thể vào cuối quý một của năm 2023, mà theo nhiều nguồn tin là ngày 24/3, trò chơi này sẽ chính thức lên kệ.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\">Off the Grid<br style=\"margin: 0px; padding: 0px; list-style: none;\"></b></p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921763953392734175-1657684299329-1657684299405170750710.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921763953392734175-1657684299329-1657684299405170750710.jpg\" id=\"img_468326638364983296\" w=\"1280\" h=\"720\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 3.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 3.\" rel=\"lightbox\" photoid=\"468326638364983296\" type=\"photo\" data-original=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-1656921763953392734175-1657684299329-1657684299405170750710.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\"></p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Không phải cái tên quá quen, thế nhưng Off the Grid đang nhận được rất nhiều kỳ vọng của các game thủ về việc sẽ góp phần làm sống lại trào lưu game sinh tồn, nhưng là theo phong cách 2.0 - nơi chính các game thủ sẽ định hình cốt truyện và cách chơi. Đó cũng chính là những lời giới thiệu của tựa game này.</p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-16569217676911710555366-1657684301405-1657684301481791948737.jpg\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-16569217676911710555366-1657684301405-1657684301481791948737.jpg\" id=\"img_468326664574734336\" w=\"640\" h=\"359\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 4.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 4.\" rel=\"lightbox\" photoid=\"468326664574734336\" type=\"photo\" data-original=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/photo-1-16569217676911710555366-1657684301405-1657684301481791948737.jpg\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\"></p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Theo một số nguồn tin, Off the Grid sẽ đưa người chơi tới series các chuỗi nhiệm vụ ám sát, chiếm cứ điểm, tiêu diệt mục tiêu hoặc phá hoại cứ điểm... Chưa kể, bản đồ của Off the Grid được cho là sẽ chứa khoảng 150 người chơi nữa.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><b style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; font-weight: bold;\"><a class=\"seo-suggest-link\" href=\"https://gamek.vn/final-fantasy.htm\" target=\"_blank\" title=\"final fantasy\" rel=\"nofollow\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none; color: rgb(0, 0, 0) !important;\">Final Fantasy</a>&nbsp;16<br style=\"margin: 0px; padding: 0px; list-style: none;\"></b></p><div class=\"VCSortableInPreviewMode noCaption\" type=\"Photo\" style=\"margin: 0px 0px 10px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; font-style: italic; text-align: center; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><a href=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/screenshot5-1656921846658893620220-1657684303483-1657684303568408681671.png\" data-fancybox-group=\"img-lightbox\" title=\"\" target=\"_blank\" class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: none;\"><img src=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/screenshot5-1656921846658893620220-1657684303483-1657684303568408681671.png\" id=\"img_468326972695183360\" w=\"1399\" h=\"697\" alt=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 5.\" title=\"10 tựa game được mong chờ nhất trong năm 2023, toàn các siêu phẩm, bom tấn ẩn mình ít người biết (p2) - Ảnh 5.\" rel=\"lightbox\" photoid=\"468326972695183360\" type=\"photo\" data-original=\"https://toquoc.mediacdn.vn/280518851207290880/2022/7/13/screenshot5-1656921846658893620220-1657684303483-1657684303568408681671.png\" width=\"\" height=\"\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 0px; outline: none; color: transparent; max-width: 100%;\"></a></div><div class=\"PhotoCMS_Caption\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px;\"><p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\" style=\"margin: 10px 0px 0px; padding: 0px 0px 20px; list-style: none; border: 0px; outline: none;\"></p></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Thực tế, Final Fantasy 16 lẽ ra đã xuất hiện sớm hơn, nhưng theo lời của nhà phát triển, tựa game này đã phải lùi lại khá lâu vì những tác động to lớn của đại dịch. Mặc dù vẫn thường xuyên lên tiếng trấn an các fan, nhưng việc Final Fantasy 16 bị chậm phát triển tới gần nửa năm vẫn khiến rất nhiều người phẫn nộ.</p><div id=\"admzone508553\" class=\"wp100 mt-10\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; font-size: 17px; outline: 0px; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\"><div id=\"zone-508553\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><div id=\"share-jny24v1r\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><div id=\"placement-khju3tj9\" revenue=\"cpm\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><div id=\"banner-508553-khju3tjo\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px; min-height: 0px; min-width: 0px;\"><div id=\"slot-1-508553-khju3tjo\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><div id=\"ssppagebid_8371\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><div id=\"sspbid_2017274\" data-ssp=\"sspbid_2017274\" class=\"banner0\" data-admssprqid=\"d77c5858-ad0b-4678-a97a-3c236284c16f115-62cfbd64\" data-location=\"4\" data-width=\"undefined\" data-height=\"undefined\" style=\"margin: 0px; padding: 0px; list-style: none; border: 0px; outline: 0px;\"><iframe id=\"ads-place-2017274\" scrolling=\"no\" width=\"0\" height=\"0\" style=\"margin: 0px; padding: 0px; list-style: none; border-width: 0px; border-style: initial; outline: none; max-width: 100%;\"></iframe></div></div></div></div></div></div></div></div><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 0px 20px; list-style: none; border: 0px; font-size: 17px; outline: none; color: rgb(51, 51, 51); font-family: &quot;Times New Roman&quot;;\">Tuy vậy, thương hiệu Final Fantasy vẫn luôn thu hút được vô số sự chú ý và là tựa game đáng để mong chờ nhất trong năm sau.</p>', NULL, 'http://127.0.0.1:8000/storage/photos/1/Blog/photo-1-16569223844221208211502.jpg', 'Game', 2, NULL, 1, 'active', '2022-07-13 23:56:20', '2022-07-13 23:56:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Anime', 'anime', 'active', '2022-07-08 19:19:23', '2022-07-08 19:19:23'),
(2, 'Game', 'game', 'active', '2022-07-08 19:19:32', '2022-07-08 19:19:32'),
(3, 'Movie', 'movie', 'active', '2022-07-08 19:19:50', '2022-07-08 19:19:50'),
(4, 'Manga', 'manga', 'active', '2022-07-08 19:21:36', '2022-07-08 19:21:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Anime', 'anime', 'active', '2022-07-08 19:20:03', '2022-07-08 19:20:03'),
(2, 'Game', 'game', 'active', '2022-07-08 19:20:09', '2022-07-08 19:20:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'fewu fgwefiewfnejwnfwjinfoqiefoiwefoewlfmwokenfoqn', 'http://127.0.0.1:8000/storage/photos/1/LOGO.jpg', 'http://127.0.0.1:8000/storage/photos/1/LOGO.jpg', 'dia chỉ la day', '1234567890', 'doantotnghiepcuathu@gmail.com', NULL, '2022-07-05 20:58:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'xuanthu', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', 'http://127.0.0.1:8000/storage/photos/1/users/289329030_2174288289387206_6432249943584638777_n.jpg', 'admin', NULL, NULL, 'active', 'V0MwvNit4K2zEW1N2z1Qgkym5fIakpRldSIC39okC8LN4bo4a6L13XAzwXfL', NULL, '2022-06-28 02:26:45'),
(2, 'User Test', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', 'http://127.0.0.1:8000/storage/photos/2/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2022-07-06 19:42:31'),
(3, 'xuanthu', 'xuanthu13090@gmail.com', NULL, NULL, NULL, 'user', 'github', '59557208', 'active', NULL, '2022-06-30 00:55:01', '2022-06-30 00:55:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
