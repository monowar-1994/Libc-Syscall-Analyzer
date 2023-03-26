; ModuleID = 'src/legacy/err.c'
source_filename = "src/legacy/err.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@__stderr_FILE = external hidden global %struct._IO_FILE, align 1
@.str = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@__progname = external local_unnamed_addr global i8*, align 8
@.str.1 = private unnamed_addr constant [3 x i8] c": \00", align 1

; Function Attrs: nounwind optsize strictfp
define void @vwarn(i8* noundef %0, %struct.__va_list_tag* noundef %1) local_unnamed_addr #0 {
  %3 = load i8*, i8** @__progname, align 8, !tbaa !3
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* noundef %3) #6
  %5 = icmp eq i8* %0, null
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @vfprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef nonnull %0, %struct.__va_list_tag* noundef %1) #6
  %8 = tail call i32 @fputs(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), %struct._IO_FILE* noundef nonnull @__stderr_FILE) #6
  br label %9

9:                                                ; preds = %6, %2
  tail call void @perror(i8* noundef null) #6
  ret void
}

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @vfprintf(%struct._IO_FILE* noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @fputs(i8* noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @perror(i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @vwarnx(i8* noundef %0, %struct.__va_list_tag* noundef %1) local_unnamed_addr #0 {
  %3 = load i8*, i8** @__progname, align 8, !tbaa !3
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* noundef %3) #6
  %5 = icmp eq i8* %0, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @vfprintf(%struct._IO_FILE* noundef nonnull @__stderr_FILE, i8* noundef nonnull %0, %struct.__va_list_tag* noundef %1) #6
  br label %8

8:                                                ; preds = %6, %2
  %9 = tail call i32 @putc(i32 noundef 10, %struct._IO_FILE* noundef nonnull @__stderr_FILE) #6
  ret void
}

; Function Attrs: optsize
declare i32 @putc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: noreturn nounwind optsize strictfp
define void @verr(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef %2) local_unnamed_addr #2 {
  tail call void @vwarn(i8* noundef %1, %struct.__va_list_tag* noundef %2) #7
  tail call void @exit(i32 noundef %0) #8
  unreachable
}

; Function Attrs: noreturn optsize
declare void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: noreturn nounwind optsize strictfp
define void @verrx(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef %2) local_unnamed_addr #2 {
  tail call void @vwarnx(i8* noundef %1, %struct.__va_list_tag* noundef %2) #7
  tail call void @exit(i32 noundef %0) #8
  unreachable
}

; Function Attrs: nounwind optsize strictfp
define void @warn(i8* noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #9
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %3) #10
  call void @vwarn(i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4) #7
  call void @llvm.va_end(i8* nonnull %3) #10
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #9
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #5

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #5

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: nounwind optsize strictfp
define void @warnx(i8* noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #9
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %3) #10
  call void @vwarnx(i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4) #7
  call void @llvm.va_end(i8* nonnull %3) #10
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #9
  ret void
}

; Function Attrs: noreturn nounwind optsize strictfp
define void @err(i32 noundef %0, i8* noundef %1, ...) local_unnamed_addr #2 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #9
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %4) #10
  call void @verr(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef nonnull %5) #11
  unreachable
}

; Function Attrs: noreturn nounwind optsize strictfp
define void @errx(i32 noundef %0, i8* noundef %1, ...) local_unnamed_addr #2 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #9
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %4) #10
  call void @verrx(i32 noundef %0, i8* noundef %1, %struct.__va_list_tag* noundef nonnull %5) #11
  unreachable
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #5 = { mustprogress nofree nosync nounwind willreturn }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin optsize strictfp "no-builtins" }
attributes #8 = { nobuiltin noreturn nounwind optsize strictfp "no-builtins" }
attributes #9 = { nounwind strictfp }
attributes #10 = { strictfp }
attributes #11 = { nobuiltin noreturn optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
