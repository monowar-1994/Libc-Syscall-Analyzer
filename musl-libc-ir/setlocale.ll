; ModuleID = 'src/locale/setlocale.c'
source_filename = "src/locale/setlocale.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__locale_lock = external hidden global [1 x i32], align 4
@__const.setlocale.part = private unnamed_addr constant [24 x i8] c"C.UTF-8\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8
@buf = internal global [144 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [2 x i8] c"C\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @setlocale(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.__locale_struct, align 8
  %4 = alloca [24 x i8], align 16
  %5 = icmp ugt i32 %0, 6
  br i1 %5, label %81, label %6

6:                                                ; preds = %2
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #4
  %7 = icmp eq i32 %0, 6
  %8 = icmp eq i8* %1, null
  br i1 %7, label %9, label %64

9:                                                ; preds = %6
  br i1 %8, label %39, label %10

10:                                               ; preds = %9
  %11 = bitcast %struct.__locale_struct* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %11) #5
  %12 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %12) #5
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 16 dereferenceable(24) %12, i8* noundef nonnull align 16 dereferenceable(24) getelementptr inbounds ([24 x i8], [24 x i8]* @__const.setlocale.part, i64 0, i64 0), i64 24, i1 false) #6
  br label %13

13:                                               ; preds = %10, %34
  %14 = phi i64 [ 0, %10 ], [ %36, %34 ]
  %15 = phi i8* [ %1, %10 ], [ %29, %34 ]
  %16 = call i8* @__strchrnul(i8* noundef %15, i32 noundef 59) #4
  %17 = ptrtoint i8* %16 to i64
  %18 = ptrtoint i8* %15 to i64
  %19 = sub i64 %17, %18
  %20 = icmp slt i64 %19, 24
  br i1 %20, label %21, label %28

21:                                               ; preds = %13
  %22 = call i8* @memcpy(i8* noundef nonnull %12, i8* noundef %15, i64 noundef %19) #4
  %23 = getelementptr inbounds [24 x i8], [24 x i8]* %4, i64 0, i64 %19
  store i8 0, i8* %23, align 1, !tbaa !3
  %24 = load i8, i8* %16, align 1, !tbaa !3
  %25 = icmp eq i8 %24, 0
  %26 = getelementptr inbounds i8, i8* %16, i64 1
  %27 = select i1 %25, i8* %15, i8* %26
  br label %28

28:                                               ; preds = %21, %13
  %29 = phi i8* [ %15, %13 ], [ %27, %21 ]
  %30 = trunc i64 %14 to i32
  %31 = call %struct.__locale_map* @__get_locale(i32 noundef %30, i8* noundef nonnull %12) #4
  %32 = icmp eq %struct.__locale_map* %31, inttoptr (i64 -1 to %struct.__locale_map*)
  br i1 %32, label %33, label %34

33:                                               ; preds = %28
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %11) #5
  br label %81

34:                                               ; preds = %28
  %35 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %3, i64 0, i32 0, i64 %14
  store %struct.__locale_map* %31, %struct.__locale_map** %35, align 8, !tbaa !6
  %36 = add nuw nsw i64 %14, 1
  %37 = icmp eq i64 %36, 6
  br i1 %37, label %38, label %13

38:                                               ; preds = %34
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 8 dereferenceable(48) bitcast (%struct.__locale_struct* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 11) to i8*), i8* noundef nonnull align 8 dereferenceable(48) %11, i64 48, i1 false) #6, !tbaa.struct !8
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #5
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %11) #5
  br label %39

39:                                               ; preds = %38, %9
  br label %40

40:                                               ; preds = %39, %40
  %41 = phi i64 [ %58, %40 ], [ 0, %39 ]
  %42 = phi i32 [ %49, %40 ], [ 0, %39 ]
  %43 = phi i8* [ %57, %40 ], [ getelementptr inbounds ([144 x i8], [144 x i8]* @buf, i64 0, i64 0), %39 ]
  %44 = getelementptr inbounds %struct.__libc, %struct.__libc* @__libc, i64 0, i32 11, i32 0, i64 %41
  %45 = load %struct.__locale_map*, %struct.__locale_map** %44, align 8, !tbaa !6
  %46 = load %struct.__locale_map*, %struct.__locale_map** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 11, i32 0, i64 0), align 8, !tbaa !6
  %47 = icmp eq %struct.__locale_map* %45, %46
  %48 = zext i1 %47 to i32
  %49 = add nuw nsw i32 %42, %48
  %50 = icmp eq %struct.__locale_map* %45, null
  %51 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %45, i64 0, i32 2, i64 0
  %52 = select i1 %50, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* %51
  %53 = call i64 @strlen(i8* noundef %52) #4
  %54 = call i8* @memcpy(i8* noundef nonnull %43, i8* noundef %52, i64 noundef %53) #4
  %55 = getelementptr inbounds i8, i8* %43, i64 %53
  store i8 59, i8* %55, align 1, !tbaa !3
  %56 = add i64 %53, 1
  %57 = getelementptr inbounds i8, i8* %43, i64 %56
  %58 = add nuw nsw i64 %41, 1
  %59 = icmp eq i64 %58, 6
  br i1 %59, label %60, label %40

60:                                               ; preds = %40
  %61 = getelementptr inbounds i8, i8* %43, i64 %53
  store i8 0, i8* %61, align 1, !tbaa !3
  call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #4
  %62 = icmp eq i32 %49, 6
  %63 = select i1 %62, i8* %52, i8* getelementptr inbounds ([144 x i8], [144 x i8]* @buf, i64 0, i64 0)
  br label %81

64:                                               ; preds = %6
  br i1 %8, label %72, label %65

65:                                               ; preds = %64
  %66 = tail call %struct.__locale_map* @__get_locale(i32 noundef %0, i8* noundef nonnull %1) #4
  %67 = icmp eq %struct.__locale_map* %66, inttoptr (i64 -1 to %struct.__locale_map*)
  br i1 %67, label %68, label %69

68:                                               ; preds = %65
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #4
  br label %81

69:                                               ; preds = %65
  %70 = zext i32 %0 to i64
  %71 = getelementptr inbounds %struct.__libc, %struct.__libc* @__libc, i64 0, i32 11, i32 0, i64 %70
  store %struct.__locale_map* %66, %struct.__locale_map** %71, align 8, !tbaa !6
  br label %76

72:                                               ; preds = %64
  %73 = zext i32 %0 to i64
  %74 = getelementptr inbounds %struct.__libc, %struct.__libc* @__libc, i64 0, i32 11, i32 0, i64 %73
  %75 = load %struct.__locale_map*, %struct.__locale_map** %74, align 8, !tbaa !6
  br label %76

76:                                               ; preds = %72, %69
  %77 = phi %struct.__locale_map* [ %66, %69 ], [ %75, %72 ]
  %78 = icmp eq %struct.__locale_map* %77, null
  %79 = getelementptr inbounds %struct.__locale_map, %struct.__locale_map* %77, i64 0, i32 2, i64 0
  %80 = select i1 %78, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* %79
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @__locale_lock, i64 0, i64 0)) #4
  br label %81

81:                                               ; preds = %33, %60, %2, %76, %68
  %82 = phi i8* [ null, %68 ], [ %80, %76 ], [ null, %2 ], [ %63, %60 ], [ null, %33 ]
  ret i8* %82
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: optsize
declare hidden i8* @__strchrnul(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden %struct.__locale_map* @__get_locale(i32 noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{i64 0, i64 48, !3}
