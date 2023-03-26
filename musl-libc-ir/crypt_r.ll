; ModuleID = 'src/crypt/crypt_r.c'
source_filename = "src/crypt/crypt_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.crypt_data = type { i32, [256 x i8] }

@crypt_r = weak alias i8* (i8*, i8*, %struct.crypt_data*), i8* (i8*, i8*, %struct.crypt_data*)* @__crypt_r

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__crypt_r(i8* noundef %0, i8* noundef %1, %struct.crypt_data* noundef %2) #0 {
  %4 = bitcast %struct.crypt_data* %2 to i8*
  %5 = load i8, i8* %1, align 1, !tbaa !3
  %6 = icmp eq i8 %5, 36
  br i1 %6, label %7, label %34

7:                                                ; preds = %3
  %8 = getelementptr inbounds i8, i8* %1, i64 1
  %9 = load i8, i8* %8, align 1, !tbaa !3
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %34, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds i8, i8* %1, i64 2
  %13 = load i8, i8* %12, align 1, !tbaa !3
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %34, label %15

15:                                               ; preds = %11
  %16 = icmp eq i8 %9, 49
  %17 = icmp eq i8 %13, 36
  %18 = select i1 %16, i1 %17, i1 false
  br i1 %18, label %19, label %21

19:                                               ; preds = %15
  %20 = tail call i8* @__crypt_md5(i8* noundef %0, i8* noundef nonnull %1, i8* noundef %4) #2
  br label %36

21:                                               ; preds = %15
  switch i8 %9, label %34 [
    i8 50, label %22
    i8 53, label %28
    i8 54, label %31
  ]

22:                                               ; preds = %21
  %23 = getelementptr inbounds i8, i8* %1, i64 3
  %24 = load i8, i8* %23, align 1, !tbaa !3
  %25 = icmp eq i8 %24, 36
  br i1 %25, label %26, label %34

26:                                               ; preds = %22
  %27 = tail call i8* @__crypt_blowfish(i8* noundef %0, i8* noundef nonnull %1, i8* noundef %4) #2
  br label %36

28:                                               ; preds = %21
  br i1 %17, label %29, label %34

29:                                               ; preds = %28
  %30 = tail call i8* @__crypt_sha256(i8* noundef %0, i8* noundef nonnull %1, i8* noundef %4) #2
  br label %36

31:                                               ; preds = %21
  br i1 %17, label %32, label %34

32:                                               ; preds = %31
  %33 = tail call i8* @__crypt_sha512(i8* noundef %0, i8* noundef nonnull %1, i8* noundef %4) #2
  br label %36

34:                                               ; preds = %21, %22, %28, %31, %11, %7, %3
  %35 = tail call i8* @__crypt_des(i8* noundef %0, i8* noundef nonnull %1, i8* noundef %4) #2
  br label %36

36:                                               ; preds = %34, %32, %29, %26, %19
  %37 = phi i8* [ %20, %19 ], [ %27, %26 ], [ %30, %29 ], [ %33, %32 ], [ %35, %34 ]
  ret i8* %37
}

; Function Attrs: optsize
declare hidden i8* @__crypt_md5(i8* noundef, i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__crypt_blowfish(i8* noundef, i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__crypt_sha256(i8* noundef, i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__crypt_sha512(i8* noundef, i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i8* @__crypt_des(i8* noundef, i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
