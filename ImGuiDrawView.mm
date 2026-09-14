#import <Metal/Metal.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <mach-o/dyld.h>

// استدعاء مكتبة dobby الاحترافية لتعديل الذاكرة وتخطي نظام الحماية
#import "5Toubun/dobby.h"

// دالة جلب مسار ذاكرة اللعبة (قاعدة البيانات الأساسية)
uintptr_t getRealOffset(uintptr_t offset) {
    return _dyld_get_image_header(0) + offset;
} 

// دالة الحماية والتمويه - تعمل تلقائياً بالخلفية فور تشغيل اللعبة دون إظهار أي منيو
__attribute__((constructor)) static void initialize_silent_patches() {
    
    // الانتظار لثوانٍ معدودة حتى تكتمل ملفات اللعبة في الذاكرة لتفادي الكراش التلقائي
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 1. تفعيل الأيم الصغير تلقائياً (Offset: 0x345C504)
        dobby_dummy_patch_rx((void*)getRealOffset(0x345C504), (uint8_t*)"\x1E\x27\x03\xE0", 4);

        // 2. تفعيل الأيم بوت التلقائي الآمن (Offset: 0x2FCA774)
        dobby_dummy_patch_rx((void*)getRealOffset(0x2FCA774), (uint8_t*)"\x1E\x27\xF0\x08", 4);

        // 3. تفعيل لون اللاعب الأحمر Chams (Offset: 0x66EEDA0)
        dobby_dummy_patch_rx((void*)getRealOffset(0x66EEDA0), (uint8_t*)"\x1E\x27\xF0\x00", 4);

        // 4. تفعيل ثبات السلاح التلقائي (Offset: 0x345F640)
        dobby_dummy_patch_rx((void*)getRealOffset(0x345F640), (uint8_t*)"\xD6\x5F\x03\xC0", 4);
        
    });
}
