; ModuleID = 'src/ldso/dlerror.c'
source_filename = "src/ldso/dlerror.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [59 x i8] c"Dynamic linker failed to allocate memory for error message\00", align 1
@freebuf_queue_lock = internal global [1 x i32] zeroinitializer, align 4
@__dlerror_lockptr = hidden local_unnamed_addr constant i32* getelementptr inbounds ([1 x i32], [1 x i32]* @freebuf_queue_lock, i64 0, i64 0), align 8
@freebuf_queue = internal unnamed_addr global i8** null, align 8
@.str.1 = private unnamed_addr constant [26 x i8] c"Invalid library handle %p\00", align 1

@__dl_invalid_handle = weak hidden alias i32 (i8*), i32 (i8*)* @stub_invalid_handle

; Function Attrs: nounwind optsize strictfp
define i8* @dlerror() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 12
  %4 = load i8, i8* %3, align 2
  %5 = and i8 %4, 2
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %13, label %7

7:                                                ; preds = %0
  %8 = and i8 %4, -3
  store i8 %8, i8* %3, align 2
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 26
  %10 = load i8*, i8** %9, align 8, !tbaa !4
  %11 = icmp eq i8* %10, inttoptr (i64 -1 to i8*)
  %12 = select i1 %11, i8* getelementptr inbounds ([59 x i8], [59 x i8]* @.str, i64 0, i64 0), i8* %10
  br label %13

13:                                               ; preds = %0, %7
  %14 = phi i8* [ %12, %7 ], [ null, %0 ]
  ret i8* %14
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__dl_thread_cleanup() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 26
  %4 = load i8*, i8** %3, align 8, !tbaa !4
  %5 = ptrtoint i8* %4 to i64
  switch i64 %5, label %6 [
    i64 0, label %10
    i64 -1, label %10
  ]

6:                                                ; preds = %0
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @freebuf_queue_lock, i64 0, i64 0)) #5
  %7 = bitcast i8** %3 to i8***
  %8 = load i8**, i8*** %7, align 8, !tbaa !4
  %9 = load i8*, i8** bitcast (i8*** @freebuf_queue to i8**), align 8, !tbaa !12
  store i8* %9, i8** %8, align 8, !tbaa !12
  store i8** %8, i8*** @freebuf_queue, align 8, !tbaa !12
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @freebuf_queue_lock, i64 0, i64 0)) #5
  br label %10

10:                                               ; preds = %0, %0, %6
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden void @__dl_vseterr(i8* noundef %0, %struct.__va_list_tag* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  tail call void @__lock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @freebuf_queue_lock, i64 0, i64 0)) #5
  %4 = load i8**, i8*** @freebuf_queue, align 8, !tbaa !12
  store i8** null, i8*** @freebuf_queue, align 8, !tbaa !12
  tail call void @__unlock(i32* noundef getelementptr inbounds ([1 x i32], [1 x i32]* @freebuf_queue_lock, i64 0, i64 0)) #5
  %5 = icmp eq i8** %4, null
  br i1 %5, label %12, label %6

6:                                                ; preds = %2, %6
  %7 = phi i8** [ %9, %6 ], [ %4, %2 ]
  %8 = bitcast i8** %7 to i8***
  %9 = load i8**, i8*** %8, align 8, !tbaa !12
  %10 = bitcast i8** %7 to i8*
  tail call void @__libc_free(i8* noundef nonnull %10) #5
  %11 = icmp eq i8** %9, null
  br i1 %11, label %12, label %6

12:                                               ; preds = %6, %2
  %13 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %13) #6
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0
  %15 = bitcast %struct.__va_list_tag* %1 to i8*
  call void @llvm.va_copy(i8* nonnull %13, i8* %15) #7
  %16 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %17 = inttoptr i64 %16 to %struct.__pthread*
  %18 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %17, i64 0, i32 26
  %19 = load i8*, i8** %18, align 8, !tbaa !4
  %20 = icmp eq i8* %19, inttoptr (i64 -1 to i8*)
  br i1 %20, label %22, label %21

21:                                               ; preds = %12
  call void @__libc_free(i8* noundef %19) #5
  br label %22

22:                                               ; preds = %21, %12
  %23 = call i32 @vsnprintf(i8* noundef null, i64 noundef 0, i8* noundef %0, %struct.__va_list_tag* noundef nonnull %14) #5
  %24 = sext i32 %23 to i64
  %25 = icmp ugt i64 %24, 8
  %26 = select i1 %25, i64 %24, i64 8
  call void @llvm.va_end(i8* nonnull %13) #7
  %27 = add nsw i64 %26, 1
  %28 = call i8* @__libc_malloc(i64 noundef %27) #5
  %29 = icmp eq i8* %28, null
  br i1 %29, label %32, label %30

30:                                               ; preds = %22
  %31 = call i32 @vsnprintf(i8* noundef nonnull %28, i64 noundef %27, i8* noundef %0, %struct.__va_list_tag* noundef %1) #5
  br label %32

32:                                               ; preds = %22, %30
  %33 = phi i8* [ %28, %30 ], [ inttoptr (i64 -1 to i8*), %22 ]
  store i8* %33, i8** %18, align 8, !tbaa !4
  %34 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %17, i64 0, i32 12
  %35 = load i8, i8* %34, align 2
  %36 = or i8 %35, 2
  store i8 %36, i8* %34, align 2
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %13) #6
  ret void
}

; Function Attrs: optsize
declare hidden void @__libc_free(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_copy(i8*, i8*) #3

; Function Attrs: optsize
declare i32 @vsnprintf(i8* noundef, i64 noundef, i8* noundef, %struct.__va_list_tag* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: optsize
declare hidden i8* @__libc_malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden void @__dl_seterr(i8* noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %3) #6
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %3) #7
  call void @__dl_vseterr(i8* noundef %0, %struct.__va_list_tag* noundef nonnull %4) #8
  call void @llvm.va_end(i8* nonnull %3) #7
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %3) #6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #3

; Function Attrs: nounwind optsize strictfp
define internal i32 @stub_invalid_handle(i8* noundef %0) #0 {
  tail call void (i8*, ...) @__dl_seterr(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i64 0, i64 0), i8* noundef %0) #8
  ret i32 1
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind readnone strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { strictfp }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 248408}
!4 = !{!5, !6, i64 184}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!6, !6, i64 0}
