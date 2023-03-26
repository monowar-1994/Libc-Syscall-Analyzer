; ModuleID = 'src/env/__reset_tls.c'
source_filename = "src/env/__reset_tls.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__reset_tls() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 1
  %4 = load i64*, i64** %3, align 8, !tbaa !4
  %5 = load i64, i64* %4, align 8, !tbaa !12
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %31, label %7

7:                                                ; preds = %0, %28
  %8 = phi i64* [ %30, %28 ], [ %4, %0 ]
  %9 = phi %struct.tls_module** [ %29, %28 ], [ getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 6), %0 ]
  %10 = phi i64 [ %26, %28 ], [ 1, %0 ]
  %11 = load %struct.tls_module*, %struct.tls_module** %9, align 8
  %12 = getelementptr inbounds i64, i64* %8, i64 %10
  %13 = load i64, i64* %12, align 8, !tbaa !12
  %14 = inttoptr i64 %13 to i8*
  %15 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %11, i64 0, i32 1
  %16 = load i8*, i8** %15, align 8, !tbaa !13
  %17 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %11, i64 0, i32 2
  %18 = load i64, i64* %17, align 8, !tbaa !15
  %19 = tail call i8* @memcpy(i8* noundef %14, i8* noundef %16, i64 noundef %18) #3
  %20 = load i64, i64* %17, align 8, !tbaa !15
  %21 = getelementptr inbounds i8, i8* %14, i64 %20
  %22 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %11, i64 0, i32 3
  %23 = load i64, i64* %22, align 8, !tbaa !16
  %24 = sub i64 %23, %20
  %25 = tail call i8* @memset(i8* noundef %21, i32 noundef 0, i64 noundef %24) #3
  %26 = add i64 %10, 1
  %27 = icmp ugt i64 %26, %5
  br i1 %27, label %31, label %28

28:                                               ; preds = %7
  %29 = getelementptr inbounds %struct.tls_module, %struct.tls_module* %11, i64 0, i32 0
  %30 = load i64*, i64** %3, align 8, !tbaa !4
  br label %7

31:                                               ; preds = %7, %0
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 249493}
!4 = !{!5, !6, i64 8}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!9, !9, i64 0}
!13 = !{!14, !6, i64 8}
!14 = !{!"tls_module", !6, i64 0, !6, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40}
!15 = !{!14, !9, i64 16}
!16 = !{!14, !9, i64 24}
