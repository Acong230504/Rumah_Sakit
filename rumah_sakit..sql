/*
 Navicat Premium Data Transfer

 Source Server         : acong
 Source Server Type    : MySQL
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : rumah_sakit

 Target Server Type    : MySQL
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 15/11/2024 22:13:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dokter
-- ----------------------------
DROP TABLE IF EXISTS `dokter`;
CREATE TABLE `dokter`  (
  `id_dokter` int NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `spesialis` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_telpon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_dokter`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dokter
-- ----------------------------

-- ----------------------------
-- Table structure for kunjungan
-- ----------------------------
DROP TABLE IF EXISTS `kunjungan`;
CREATE TABLE `kunjungan`  (
  `id_kunjungan` int NOT NULL,
  `id_pasien` int NULL DEFAULT NULL,
  `id_dokter` int NULL DEFAULT NULL,
  `tanggal_kunjungan` date NULL DEFAULT NULL,
  `diagnosis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tindakan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_kunjungan`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kunjungan
-- ----------------------------

-- ----------------------------
-- Table structure for pasien
-- ----------------------------
DROP TABLE IF EXISTS `pasien`;
CREATE TABLE `pasien`  (
  `id_pasien` int NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telpon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_pasien`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pasien
-- ----------------------------

-- ----------------------------
-- View structure for v_riwayat_kunjungan
-- ----------------------------
DROP VIEW IF EXISTS `v_riwayat_kunjungan`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_riwayat_kunjungan` AS SELECT 
    pasien.nama AS nama_pasien,
    dokter.nama AS nama_dokter,
    kunjungan.tanggal_kunjungan,
    kunjungan.diagnosis,
    kunjungan.tindakan
FROM 
    kunjungan
JOIN 
    pasien ON kunjungan.id_pasien = pasien.id_pasien
JOIN 
    dokter ON kunjungan.id_dokter = dokter.id_dokter ;

SET FOREIGN_KEY_CHECKS = 1;
