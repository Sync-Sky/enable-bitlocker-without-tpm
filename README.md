# 🔒 BitLocker Enable Without TPM (C: & D:)

Batch Script สำหรับเปิดใช้งาน BitLocker Encryption บน Windows สำหรับไดรฟ์ C: และ D: โดย**ไม่ต้องใช้ชิป TPM** (No TPM Required) พร้อมระบบปลดล็อกอัตโนมัติสำหรับไดรฟ์ D:

---

## ⚠️ คำเตือนสำคัญ (Important Warning)

1. **บันทึก Recovery Key ไว้ทันที:** หลังรันสคริปต์เสร็จ หน้าจอจะแสดง **Recovery Key (48 หลัก)** ให้ถ่ายรูป หรือจดบันทึกไว้ในสถานที่ปลอดภัยทันที
2. **การรีสตาร์ทเครื่อง:** สคริปต์จะทำการ **Restart เครื่องอัตโนมัติภายใน 10 วินาที** หลังทำงานเสร็จสิ้น กรุณาเซฟงานทั้งหมดก่อนรันสคริปต์
3. **ตั้งรหัสผ่าน:** ในขั้นตอนการรัน สคริปต์จะถามรหัสผ่าน (Startup Password) สำหรับไดรฟ์ C: ให้ตั้งรหัสผ่านที่จำได้ง่ายแต่ปลอดภัย

---

## ✨ คุณสมบัติของสคริปต์ (Features)

- 🛠️ **Bypass TPM Requirement:** แก้ไข Registry และ Group Policy ให้เปิดใช้ BitLocker ได้แม้อุปกรณ์ไม่มีชิป TPM[cite: 1]
- 🔐 **Drive C: Protection:** ตั้งค่าให้ใช้ รหัสผ่าน (Startup Password) ก่อนเข้า Windows ร่วมกับ Recovery Key[cite: 1]
- 💽 **Drive D: Protection:** เปิดใช้งาน BitLocker พร้อมตั้งค่า Auto-Unlock (ปลดล็อกอัตโนมัติเมื่อเข้า Windows)[cite: 1]
- ⚡ **Auto Admin Privilege:** สคริปต์ยกระดับสิทธิ์เป็น Administrator ให้อัตโนมัติเมื่อกดรัน[cite: 1]

---

## 🚀 วิธีใช้งาน (Usage)

1. ดาวน์โหลดไฟล์ `bitlocker.bat` (หรือก๊อปปี้โค้ดไปวางใน Notepad แล้วบันทึกเป็นนามสกุล `.bat`)[cite: 1]
2. คลิกขวาที่ไฟล์ `bitlocker.bat` แล้วเลือก **Run as administrator**[cite: 1]
3. ทำตามขั้นตอนบนหน้าจอ:
   - พิมพ์ตั้งรหัสผ่านสำหรับไดรฟ์ C: ตามที่ระบบถาม[cite: 1]
   - จด/ถ่ายรูป **Recovery Key** ที่ปรากฏบนหน้าจอ[cite: 1]
4. รอระบบ Restart เครื่องภายใน 10 วินาที[cite: 1]

---

## 📋 ความต้องการของระบบ (Requirements)

- Windows 10 / 11 รุ่น Pro, Enterprise หรือ Education (รุ่น Home ไม่รองรับ BitLocker)
- ไดรฟ์ C: และ D: ที่เป็นฟอร์แมต NTFS

---

## ☕ Support / Donating (สนับสนุนนักพัฒนา)

หากสคริปต์นี้เป็นประโยชน์และช่วยประหยัดเวลาของคุณ สามารถร่วมเลี้ยงกาแฟหรือสนับสนุนนักพัฒนาได้ที่นี่ครับ:

- **PromptPay / Buy Me a Coffee:**
- <img width="209" height="210" alt="image" src="https://github.com/user-attachments/assets/f0e12a5b-2a1d-4952-a733-aeede5e9cb20" />
- **Ko-fi:** https://ko-fi.com/syncsky



---

## 📜 License

โปรเจกต์นี้เปิดให้ใช้งานฟรีภายใต้สัญญานุญาต **MIT License**
