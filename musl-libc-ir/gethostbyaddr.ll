; ModuleID = 'src/network/gethostbyaddr.c'
source_filename = "src/network/gethostbyaddr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }

@gethostbyaddr.h = internal unnamed_addr global %struct.hostent* null, align 8

; Function Attrs: nounwind optsize strictfp
define %struct.hostent* @gethostbyaddr(i8* noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = alloca %struct.hostent*, align 8
  %5 = bitcast %struct.hostent** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  br label %6

6:                                                ; preds = %15, %3
  %7 = phi i64 [ 63, %3 ], [ %10, %15 ]
  %8 = load i8*, i8** bitcast (%struct.hostent** @gethostbyaddr.h to i8**), align 8, !tbaa !3
  call void @free(i8* noundef %8) #5
  %9 = shl i64 %7, 1
  %10 = or i64 %9, 1
  %11 = call i8* @malloc(i64 noundef %10) #5
  store i8* %11, i8** bitcast (%struct.hostent** @gethostbyaddr.h to i8**), align 8, !tbaa !3
  %12 = icmp eq i8* %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %6
  %14 = tail call i32* @__h_errno_location() #6
  store i32 3, i32* %14, align 4, !tbaa !7
  br label %26

15:                                               ; preds = %6
  %16 = bitcast i8* %11 to %struct.hostent*
  %17 = getelementptr inbounds i8, i8* %11, i64 32
  %18 = add i64 %9, -31
  %19 = tail call i32* @__h_errno_location() #6
  %20 = call i32 @gethostbyaddr_r(i8* noundef %0, i32 noundef %1, i32 noundef %2, %struct.hostent* noundef nonnull %16, i8* noundef nonnull %17, i64 noundef %18, %struct.hostent** noundef nonnull %4, i32* noundef %19) #5
  %21 = icmp eq i32 %20, 34
  br i1 %21, label %6, label %22

22:                                               ; preds = %15
  %23 = icmp eq i32 %20, 0
  %24 = load %struct.hostent*, %struct.hostent** @gethostbyaddr.h, align 8
  %25 = select i1 %23, %struct.hostent* %24, %struct.hostent* null
  br label %26

26:                                               ; preds = %22, %13
  %27 = phi %struct.hostent* [ %25, %22 ], [ null, %13 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  ret %struct.hostent* %27
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare i32* @__h_errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @gethostbyaddr_r(i8* noundef, i32 noundef, i32 noundef, %struct.hostent* noundef, i8* noundef, i64 noundef, %struct.hostent** noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
