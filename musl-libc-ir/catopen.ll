; ModuleID = 'src/locale/catopen.c'
source_filename = "src/locale/catopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@.str = private unnamed_addr constant [8 x i8] c"NLSPATH\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"LANG\00", align 1
@.str.2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"_.@\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c".@\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"UTF-8\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"%\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @catopen(i8* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca [4096 x i8], align 16
  %4 = tail call i8* @strchr(i8* noundef %0, i32 noundef 47) #5
  %5 = icmp eq i8* %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = tail call fastcc i8* @do_catopen(i8* noundef %0) #6
  br label %98

8:                                                ; preds = %2
  %9 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4096, i8* nonnull %9) #7
  %10 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !3
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %12, label %94

12:                                               ; preds = %8
  %13 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)) #5
  %14 = icmp eq i8* %13, null
  br i1 %14, label %94, label %15

15:                                               ; preds = %12
  %16 = icmp eq i32 %1, 0
  br i1 %16, label %19, label %17

17:                                               ; preds = %15
  %18 = tail call i8* @nl_langinfo(i32 noundef 393215) #5
  br label %21

19:                                               ; preds = %15
  %20 = tail call i8* @getenv(i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)) #5
  br label %21

21:                                               ; preds = %19, %17
  %22 = phi i8* [ %18, %17 ], [ %20, %19 ]
  %23 = icmp eq i8* %22, null
  %24 = select i1 %23, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.2, i64 0, i64 0), i8* %22
  %25 = load i8, i8* %13, align 1, !tbaa !11
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %94, label %27

27:                                               ; preds = %21, %90
  %28 = phi i8* [ %92, %90 ], [ %13, %21 ]
  %29 = call i8* @__strchrnul(i8* noundef nonnull %28, i32 noundef 58) #5
  %30 = icmp ult i8* %28, %29
  br i1 %30, label %31, label %68

31:                                               ; preds = %27, %62
  %32 = phi i8* [ %66, %62 ], [ %28, %27 ]
  %33 = phi i64 [ %65, %62 ], [ 0, %27 ]
  %34 = load i8, i8* %32, align 1, !tbaa !11
  %35 = icmp eq i8 %34, 37
  br i1 %35, label %36, label %54

36:                                               ; preds = %31
  %37 = getelementptr inbounds i8, i8* %32, i64 1
  %38 = load i8, i8* %37, align 1, !tbaa !11
  %39 = sext i8 %38 to i32
  switch i32 %39, label %68 [
    i32 78, label %40
    i32 76, label %42
    i32 108, label %44
    i32 116, label %46
    i32 99, label %54
    i32 37, label %53
  ]

40:                                               ; preds = %36
  %41 = call i64 @strlen(i8* noundef %0) #5
  br label %54

42:                                               ; preds = %36
  %43 = call i64 @strlen(i8* noundef %24) #5
  br label %54

44:                                               ; preds = %36
  %45 = call i64 @strcspn(i8* noundef %24, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %54

46:                                               ; preds = %36
  %47 = call i8* @__strchrnul(i8* noundef %24, i32 noundef 95) #5
  %48 = load i8, i8* %47, align 1, !tbaa !11
  %49 = icmp ne i8 %48, 0
  %50 = zext i1 %49 to i64
  %51 = getelementptr i8, i8* %47, i64 %50
  %52 = call i64 @strcspn(i8* noundef nonnull %51, i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0)) #5
  br label %54

53:                                               ; preds = %36
  br label %54

54:                                               ; preds = %36, %31, %40, %42, %44, %46, %53
  %55 = phi i8* [ %37, %53 ], [ %37, %46 ], [ %37, %44 ], [ %37, %42 ], [ %37, %40 ], [ %32, %31 ], [ %37, %36 ]
  %56 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i64 0, i64 0), %53 ], [ %51, %46 ], [ %24, %44 ], [ %24, %42 ], [ %0, %40 ], [ %32, %31 ], [ getelementptr inbounds ([6 x i8], [6 x i8]* @.str.5, i64 0, i64 0), %36 ]
  %57 = phi i64 [ 1, %53 ], [ %52, %46 ], [ %45, %44 ], [ %43, %42 ], [ %41, %40 ], [ 1, %31 ], [ 5, %36 ]
  %58 = icmp ne i8* %56, null
  %59 = sub i64 4096, %33
  %60 = icmp ult i64 %57, %59
  %61 = select i1 %58, i1 %60, i1 false
  br i1 %61, label %62, label %68

62:                                               ; preds = %54
  %63 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 %33
  %64 = call i8* @memcpy(i8* noundef nonnull %63, i8* noundef nonnull %56, i64 noundef %57) #5
  %65 = add i64 %57, %33
  %66 = getelementptr inbounds i8, i8* %55, i64 1
  %67 = icmp ult i8* %66, %29
  br i1 %67, label %31, label %68

68:                                               ; preds = %62, %54, %36, %27
  %69 = phi i64 [ 0, %27 ], [ %33, %36 ], [ %33, %54 ], [ %65, %62 ]
  %70 = phi i8* [ %28, %27 ], [ %37, %36 ], [ %55, %54 ], [ %66, %62 ]
  %71 = load i8, i8* %29, align 1, !tbaa !11
  %72 = icmp eq i8 %71, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %68
  %74 = icmp uge i8* %70, %29
  %75 = icmp ne i64 %69, 0
  %76 = select i1 %74, i1 %75, i1 false
  br i1 %76, label %77, label %94

77:                                               ; preds = %73, %68
  %78 = icmp ult i8* %70, %29
  br i1 %78, label %90, label %79

79:                                               ; preds = %77
  %80 = xor i1 %72, true
  %81 = zext i1 %80 to i64
  %82 = getelementptr i8, i8* %29, i64 %81
  %83 = getelementptr inbounds [4096 x i8], [4096 x i8]* %3, i64 0, i64 %69
  store i8 0, i8* %83, align 1, !tbaa !11
  %84 = icmp eq i64 %69, 0
  %85 = select i1 %84, i8* %0, i8* %9
  %86 = call fastcc i8* @do_catopen(i8* noundef %85) #6
  %87 = icmp eq i8* %86, inttoptr (i64 -1 to i8*)
  br i1 %87, label %88, label %96

88:                                               ; preds = %79
  %89 = load i8, i8* %82, align 1, !tbaa !11
  br label %90

90:                                               ; preds = %88, %77
  %91 = phi i8 [ %71, %77 ], [ %89, %88 ]
  %92 = phi i8* [ %29, %77 ], [ %82, %88 ]
  %93 = icmp eq i8 %91, 0
  br i1 %93, label %94, label %27

94:                                               ; preds = %73, %90, %21, %8, %12
  %95 = tail call i32* @___errno_location() #8
  store i32 2, i32* %95, align 4, !tbaa !12
  br label %96

96:                                               ; preds = %79, %94
  %97 = phi i8* [ inttoptr (i64 -1 to i8*), %94 ], [ %86, %79 ]
  call void @llvm.lifetime.end.p0i8(i64 4096, i8* nonnull %9) #7
  br label %98

98:                                               ; preds = %96, %6
  %99 = phi i8* [ %7, %6 ], [ %97, %96 ]
  ret i8* %99
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i8* @do_catopen(i8* noundef %0) unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #7
  %4 = call i8* @__map_file(i8* noundef %0, i64* noundef nonnull %2) #5
  %5 = icmp eq i8* %4, null
  br i1 %5, label %24, label %6

6:                                                ; preds = %1
  %7 = bitcast i8* %4 to i32*
  %8 = load i32, i32* %7, align 4, !tbaa !12
  %9 = icmp eq i32 %8, -1979741953
  br i1 %9, label %12, label %10

10:                                               ; preds = %6
  %11 = load i64, i64* %2, align 8, !tbaa !13
  br label %21

12:                                               ; preds = %6
  %13 = getelementptr inbounds i8, i8* %4, i64 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 4, !tbaa !12
  %16 = call i32 @llvm.bswap.i32(i32 %15) #9
  %17 = add i32 %16, 20
  %18 = zext i32 %17 to i64
  %19 = load i64, i64* %2, align 8, !tbaa !13
  %20 = icmp eq i64 %19, %18
  br i1 %20, label %26, label %21

21:                                               ; preds = %10, %12
  %22 = phi i64 [ %11, %10 ], [ %19, %12 ]
  %23 = call i32 @munmap(i8* noundef nonnull %4, i64 noundef %22) #5
  br label %24

24:                                               ; preds = %1, %21
  %25 = tail call i32* @___errno_location() #8
  store i32 2, i32* %25, align 4, !tbaa !12
  br label %26

26:                                               ; preds = %12, %24
  %27 = phi i8* [ inttoptr (i64 -1 to i8*), %24 ], [ %4, %12 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #7
  ret i8* %27
}

; Function Attrs: optsize
declare i8* @getenv(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @nl_langinfo(i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strcspn(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i8* @__map_file(i8* noundef, i64* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @munmap(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.bswap.i32(i32) #4

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }
attributes #7 = { nounwind strictfp }
attributes #8 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #9 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 2}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!5, !5, i64 0}
!12 = !{!7, !7, i64 0}
!13 = !{!9, !9, i64 0}
