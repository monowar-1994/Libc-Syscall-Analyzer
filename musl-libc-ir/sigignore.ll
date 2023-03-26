; ModuleID = 'src/signal/sigignore.c'
source_filename = "src/signal/sigignore.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%union.anon = type { void (i32)* }
%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @sigignore(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.sigaction, align 8
  %3 = bitcast %struct.sigaction* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 152, i8* nonnull %3) #3
  %4 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 1
  %5 = call i32 @sigemptyset(%struct.__sigset_t* noundef nonnull %4) #4
  %6 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 0, i32 0
  store void (i32)* inttoptr (i64 1 to void (i32)*), void (i32)** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %struct.sigaction, %struct.sigaction* %2, i64 0, i32 2
  store i32 0, i32* %7, align 8, !tbaa !6
  %8 = call i32 @sigaction(i32 noundef %0, %struct.sigaction* noundef nonnull %2, %struct.sigaction* noundef null) #4
  call void @llvm.lifetime.end.p0i8(i64 152, i8* nonnull %3) #3
  ret i32 %8
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sigemptyset(%struct.__sigset_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @sigaction(i32 noundef, %struct.sigaction* noundef, %struct.sigaction* noundef) local_unnamed_addr #2

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
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 136}
!7 = !{!"sigaction", !4, i64 0, !8, i64 8, !9, i64 136, !10, i64 144}
!8 = !{!"__sigset_t", !4, i64 0}
!9 = !{!"int", !4, i64 0}
!10 = !{!"any pointer", !4, i64 0}
