; ModuleID = 'src/passwd/fgetspent.c'
source_filename = "src/passwd/fgetspent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.spwd = type { i8*, i8*, i64, i64, i64, i64, i64, i64, i64 }
%struct._IO_FILE = type opaque

@fgetspent.line = internal global i8* null, align 8
@fgetspent.sp = internal global %struct.spwd zeroinitializer, align 8

; Function Attrs: nounwind optsize strictfp
define %struct.spwd* @fgetspent(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = bitcast i64* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #3
  store i64 0, i64* %2, align 8, !tbaa !3
  %5 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #3
  %6 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %3) #4
  %7 = call i64 @getline(i8** noundef nonnull @fgetspent.line, i64* noundef nonnull %2, %struct._IO_FILE* noundef %0) #4
  %8 = icmp sgt i64 %7, -1
  br i1 %8, label %9, label %14

9:                                                ; preds = %1
  %10 = load i8*, i8** @fgetspent.line, align 8, !tbaa !7
  %11 = call i32 @__parsespent(i8* noundef %10, %struct.spwd* noundef nonnull @fgetspent.sp) #4
  %12 = icmp sgt i32 %11, -1
  %13 = select i1 %12, %struct.spwd* @fgetspent.sp, %struct.spwd* null
  br label %14

14:                                               ; preds = %9, %1
  %15 = phi %struct.spwd* [ null, %1 ], [ %13, %9 ]
  %16 = load i32, i32* %3, align 4, !tbaa !9
  %17 = call i32 @pthread_setcancelstate(i32 noundef %16, i32* noundef null) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #3
  ret %struct.spwd* %15
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @getline(i8** noundef, i64* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__parsespent(i8* noundef, %struct.spwd* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !5, i64 0}
