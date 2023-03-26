; ModuleID = 'src/network/getservbyname.c'
source_filename = "src/network/getservbyname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.servent = type { i8*, i8**, i32, i8* }

@getservbyname.se = internal global %struct.servent zeroinitializer, align 8
@getservbyname.buf = internal global [2 x i8*] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define %struct.servent* @getservbyname(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.servent*, align 8
  %4 = bitcast %struct.servent** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #3
  %5 = call i32 @getservbyname_r(i8* noundef %0, i8* noundef %1, %struct.servent* noundef nonnull @getservbyname.se, i8* noundef bitcast ([2 x i8*]* @getservbyname.buf to i8*), i64 noundef 16, %struct.servent** noundef nonnull %3) #4
  %6 = icmp eq i32 %5, 0
  %7 = select i1 %6, %struct.servent* @getservbyname.se, %struct.servent* null
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #3
  ret %struct.servent* %7
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getservbyname_r(i8* noundef, i8* noundef, %struct.servent* noundef, i8* noundef, i64 noundef, %struct.servent** noundef) local_unnamed_addr #2

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
