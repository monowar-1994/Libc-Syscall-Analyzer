; ModuleID = 'src/crypt/crypt.c'
source_filename = "src/crypt/crypt.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.crypt_data = type { i32, [256 x i8] }

@crypt.buf = internal global [128 x i8] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define i8* @crypt(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i8* @__crypt_r(i8* noundef %0, i8* noundef %1, %struct.crypt_data* noundef bitcast ([128 x i8]* @crypt.buf to %struct.crypt_data*)) #2
  ret i8* %3
}

; Function Attrs: optsize
declare hidden i8* @__crypt_r(i8* noundef, i8* noundef, %struct.crypt_data* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
